import Foundation
import GRPC
import SwiftProtobuf

// TODO: return various error types (not only .unknown)

/// Entry point class.
///
/// - seealso:
/// https://bucketeer.io/docs/#/sdk-reference-guides-ios
///
public final class BucketeerSDK {
    private enum QueueLabels {
        static let setUserQueueLabel = "jp.co.cyberagent.bucketeer.setUserQueue"
        static let getVariationQueueLabel = "jp.co.cyberagent.bucketeer.getVariationQueue"
        static let trackQueueLabel = "jp.co.cyberagent.bucketeer.trackQueue"
        static let getEvaluationsQueueLabel = "jp.co.cyberagent.bucketeer.getEvaluationsQueue"
        static let registerEventsQueueLabel = "jp.co.cyberagent.bucketeer.registerEventsQueue"
    }
    
    private static var _shared: BucketeerSDK?
    public static var shared: BucketeerSDK {
        return _shared ?? { fatalError("Failed to access shared instance. Need to Bucketeer.setup()") }()
    }
    
    private let setUserQueue = DispatchQueue(label: QueueLabels.setUserQueueLabel, attributes: .concurrent)
    private let getVariationQueue = DispatchQueue(label: QueueLabels.getVariationQueueLabel, attributes: .concurrent)
    private let trackQueue = DispatchQueue(label: QueueLabels.trackQueueLabel, attributes: .concurrent)
    private let registerEventsQueue = DispatchQueue(label: QueueLabels.registerEventsQueueLabel)
    
    private let reachability = Reachability()!
    
    private lazy var getEvaluationsPoller: Poller = {
        return Poller(interval: self.config.getEvaluationsPollingInterval, label: QueueLabels.getEvaluationsQueueLabel) {
            self.getEvaluationsPollingEvent()
        }
    }()
    
    private lazy var registerEventsPoller: Poller = {
        return Poller(interval: self.config.registerEventsPollingInterval, label: QueueLabels.registerEventsQueueLabel) {
            self.registerEventsPollingEvent()
        }
    }()
    
    private let eventStore: EventStore
    private let latestEvaluationStore: LatestEvaluationStore
    private let currentEvaluationStore: CurrentEvaluationStore
    
    private let evaluationSynchronizer: EvaluationSynchronizer
    private let eventRegisterer: EventRegisterer
    private let eventSaver: EventSaver
    
    private let config: Config
    private let db: SQLiteDatabase
    private(set) var userEntity: UserEntity?
    private(set) var isOnline = true
    
    private enum StatusKey: Int {
        case queued = 0
        case partial = 1
        case full = 2
        
        var state: String {
            switch self {
            case .queued:
                return "QUEUED"
            case .partial:
                return "PARTIAL"
            case .full:
                return "FULL"
            }
        }
    }
    
    init(config: Config) throws {
        self.config = config
        let apiClient = APIClient(config: config)
        
        // setup DB
        do {
            #if os(tvOS)
            let directory: FileManager.SearchPathDirectory = .cachesDirectory
            #else
            let directory: FileManager.SearchPathDirectory = .libraryDirectory
            #endif
            
            let databaseURL = try FileManager.default
                .url(for: directory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("bucketeer.db.sqlite")
            db = try SQLiteDatabase.open(path: databaseURL.path)
            db.migration()
        } catch {
            Logger.shared.errorLog("Failed to setup database: \(error.localizedDescription)")
            throw error
        }
        
        eventStore = EventStore(db: db)
        latestEvaluationStore = LatestEvaluationStore(db: db)
        currentEvaluationStore = CurrentEvaluationStore(db: db)
        
        eventRegisterer = EventRegisterer(apiClient: apiClient, eventStore: eventStore)
        evaluationSynchronizer = EvaluationSynchronizer(apiClient: apiClient,
                                                        latestEvaluationStore: latestEvaluationStore,
                                                        currentEvaluationStore: currentEvaluationStore)
        eventSaver = EventSaver(eventStore: eventStore)
        
        // setup reachability
        do {
            isOnline = reachability.connection != .none
            reachability.whenReachable = { [weak self] reachability in
                self?.isOnline = true
            }
            reachability.whenUnreachable = { [weak self] _ in
                self?.isOnline = false
            }
            try reachability.startNotifier()
        } catch {
            Logger.shared.errorLog("Unable to start reachability notifier: \(error.localizedDescription)")
            throw error
        }
        
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
}

// MARK: - Functions

public extension BucketeerSDK {
    @discardableResult
    static func setup(config: Config) -> Result<Void, BucketeerError> {
        do {
            Logger.shared.setLogLevel(config.logLevel)
            Logger.shared.setPrefix(config.logPrefix)
            BucketeerSDK._shared = try BucketeerSDK(config: config)
        } catch {
            let message = "(\(Version.number)) Failed to setup: \(error.localizedDescription), config: \(config)"
            Logger.shared.errorLog(message)
            return .failure(.unknown(message))
        }
        return .success(())
    }
    
    func setUser(userID: String, userAttributes: [String: String]? = nil, completion: ((Result<Void, BucketeerError>) -> (Void))? = nil) {
        _setUser(userID: userID, userAttributes: userAttributes, completion: completion)
    }
    
    func getUser() -> User? {
        return _getUser()
    }
    
    func syncEvaluations() {
        return getEvaluationsPollingEvent()
    }
    
    // MARK: Feature
    
    func boolVariation(featureID: String, defaultValue: Bool) -> Bool {
        return getVariation(featureID: featureID, defaultValue: defaultValue)
    }
    
    func intVariation(featureID: String, defaultValue: Int) -> Int {
        return getVariation(featureID: featureID, defaultValue: defaultValue)
    }
    
    func floatVariation(featureID: String, defaultValue: Float) -> Float {
        return getVariation(featureID: featureID, defaultValue: defaultValue)
    }
    
    func stringVariation(featureID: String, defaultValue: String) -> String {
        return getVariation(featureID: featureID, defaultValue: defaultValue)
    }
    
    /// Retrieves generic variation for `feature`.
    func variation<T: VariationProtocol>(for feature: Feature<T>) -> T {
        return getVariation(featureID: feature.id, defaultValue: feature.defaultValue)
    }
    
    // MARK: Goal
    
    /// Send `goalID` and associated `value` (default is `0.0`).
    func track(goalID: String, value: Double = 0.0) {
        _track(goalID: goalID, value: value)
    }
    
    func getEvaluation(featureID: String) -> Evaluation? {
        return _getEvaluation(featureID: featureID)
    }
}

// MARK: - Setup

private extension BucketeerSDK {
    // TODO: add cares about atomic data access: ex. call setUser while processing setUser could cause unintentional data state
    func _setUser(userID: String, userAttributes: [String: String]? = nil, completion: ((Result<Void, BucketeerError>) -> Void)? = nil) {
        guard let userEntity = UserEntity(id: userID, attributes: userAttributes) else {
            let message = "(\(Version.number)) Failed to init userEntity instance"
            Logger.shared.errorLog(message)
            completion?(.failure(.unknown(message)))
            return
        }
        self.userEntity = userEntity
        setUserQueue.async {
            self.latestEvaluationStore.fetchAll(userID: userID) { [weak self] result in
                guard let me = self else {
                    let message = "(\(Version.number)) Failed to refer self in setUserQueue"
                    Logger.shared.errorLog(message)
                    completion?(.failure(.unknown(message)))
                    return
                }
                func startPolling() {
                    me.startEvaluationsPolling()
                    me.startRegisterEventsPolling()
                }
                switch result {
                case .success:
                    guard me.isOnline else {
                        startPolling()
                        let message = "Failed to setUser because the network connection was unavailable"
                        completion?(.failure(.network(message)))
                        return
                    }
                    let startTime = CFAbsoluteTimeGetCurrent()
                    me.evaluationSynchronizer.syncEvaluations(userEntity: userEntity) { result in
                        switch result {
                        case .success(let response):
                            let status = StatusKey(rawValue: response.state.rawValue)?.state ?? ""
                            me._sendGetEvaluationLatencyMetricsEvent(duration: TimeInterval(CFAbsoluteTimeGetCurrent() - startTime), state: status)
                            do {
                                let size = try response.serializedData().count
                                me._sendGetEvaluationSizeMetricsEvent(sizeByte: Int32(size), state: status)
                            } catch {
                                Logger.shared.errorLog("Unable to serialize evaluations: \(error.localizedDescription)")
                            }
                            completion?(.success(()))
                        case .failure(let error):
                            completion?(.failure(error))
                        }
                        startPolling()
                    }
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
    func _getUser() -> User? {
        if let userEntity = userEntity {
            return User(id: userEntity.user.id, data: userEntity.user.data)
        }
        return nil
    }
}

// MARK: - Logics

private extension BucketeerSDK {
    
    func getVariation<T: VariationProtocol>(featureID: String, defaultValue: T) -> T {
        guard let userEntity = userEntity else {
            return defaultValue
        }
        if let evaluationEntity = latestEvaluationStore.fetch(featureID: featureID) {
            getVariationQueue.async { [currentEvaluationStore, eventSaver] in
                currentEvaluationStore.save([evaluationEntity])
                eventSaver.saveEvaluationEvent(userEntity: userEntity, evaluationEntity: evaluationEntity, completion: self.registerEventsIfNeeded)
            }
            return T.variationValue(evaluationEntity.evaluation.variation.value) ?? defaultValue
        }
        // if there is no matched latestEvaluation in local store, add a default value event to event store
        getVariationQueue.async { [eventSaver] in
            eventSaver.saveClientDefaultEvaluationEvent(userEntity: userEntity, featureID: featureID, completion: self.registerEventsIfNeeded)
        }
        return defaultValue
    }
    
    func _track(goalID: String, value: Double) {
        trackQueue.async { [userEntity, currentEvaluationStore, eventSaver, registerEventsIfNeeded] in
            guard let userEntity = userEntity else {
                return
            }
            currentEvaluationStore.fetchAll(userID: userEntity.id) { [eventSaver, registerEventsIfNeeded] entities in
                eventSaver.saveGoalEvent(userEntity: userEntity,
                                         goalID: goalID,
                                         value: value,
                                         evaluationEntities: Set(entities),
                                         completion: registerEventsIfNeeded)
            }
        }
    }
    
    func _sendGetEvaluationLatencyMetricsEvent(duration: TimeInterval, state: String) {
        self.trackQueue.async { [duration] in
            self.eventSaver.saveGetEvaluationLatencyMetricsEvent(
                duration: duration,
                labels: ["tag": self.config.tag, "state": state],
                completion: self.registerEventsIfNeeded)
        }
    }
    
    func _sendGetEvaluationSizeMetricsEvent(sizeByte: Int32, state: String) {
        self.trackQueue.async { [sizeByte] in
            self.eventSaver.saveGetEvaluationSizeMetricsEvent(
                sizeByte: sizeByte,
                labels: ["tag": self.config.tag, "state": state],
                completion: self.registerEventsIfNeeded)
        }
    }
    
    func registerEventsIfNeeded(eventsCount: Int?) -> () {
        guard isOnline else {
            return
        }
        if let eventsCount = eventsCount, eventsCount < config.minEventsPerRequest {
            return
        }
        self._registerEvents()
    }

    func _registerEvents(completion: (() -> Void)? = nil) {
        self.registerEventsQueue.sync {
            eventStore.fetch(limit: config.maxEventsPerRequest) { eventEntities in
                self.eventRegisterer.registerEvents(eventEntities: eventEntities) { _ in
                    completion?()
                }
            }
        }
    }
    
    func _getEvaluation(featureID: String) -> Evaluation? {
        if let evaluationEntity = latestEvaluationStore.fetch(featureID: featureID) {
            return Evaluation(
                id: evaluationEntity.evaluation.id,
                featureID: evaluationEntity.evaluation.featureID,
                featureVersion: Int(evaluationEntity.evaluation.featureVersion),
                userID: evaluationEntity.evaluation.userID,
                variationID: evaluationEntity.evaluation.variationID,
                variationValue: evaluationEntity.evaluation.variation.value,
                reason: evaluationEntity.evaluation.reason.type.rawValue)
        }
        return nil
    }
}

// MARK: - Polling

private extension BucketeerSDK {
    func getEvaluationsPollingEvent() {
        Logger.shared.debugLog("getEvaluationsPollingEvent fired")
        guard isOnline, let userEntity = userEntity else {
            return
        }
        getEvaluationsPoller.stop()
        let startTime = CFAbsoluteTimeGetCurrent()
        evaluationSynchronizer.syncEvaluations(userEntity: userEntity) { result in
            switch result {
            case .success(let response):
                let status = StatusKey(rawValue: response.state.rawValue)?.state ?? ""
                self._sendGetEvaluationLatencyMetricsEvent(duration: TimeInterval(CFAbsoluteTimeGetCurrent() - startTime), state: status)
                do {
                    let size = try response.serializedData().count
                    self._sendGetEvaluationSizeMetricsEvent(sizeByte: Int32(size), state: status)
                } catch {
                    Logger.shared.errorLog("Unable to serialize evaluations: \(error.localizedDescription)")
                }
                Logger.shared.debugLog("Succeeded to sync evaluations")
            case .failure(let error):
                Logger.shared.errorLog("Failed to sync evaluations: \(error.localizedDescription)")
            }
            self.startEvaluationsPolling()
        }
    }
    
    func registerEventsPollingEvent() {
        Logger.shared.debugLog("registerEventsPollingEvent fired")
        guard isOnline else {
            return
        }
        registerEventsPoller.stop()
        self._registerEvents() {
             self.startRegisterEventsPolling()
        }
    }
}

// MARK: - Observers

private extension BucketeerSDK {
    func addObserver() {
        Logger.shared.debugLog()
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(type(of: self).willEnterForeground(notification:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        center.addObserver(self, selector: #selector(type(of: self).willEnterBackground(notification:)), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    func removeObserver() {
        Logger.shared.debugLog()
        let center = NotificationCenter.default
        center.removeObserver(self)
    }
    
    @objc func willEnterForeground(notification: Notification) {
        Logger.shared.debugLog()
        startEvaluationsPolling()
        startRegisterEventsPolling()
        do {
            try reachability.startNotifier()
        } catch {
            Logger.shared.errorLog("Unable to start reachability notifier: \(error.localizedDescription)")
        }
    }
    
    @objc func willEnterBackground(notification: Notification) {
        Logger.shared.debugLog()
        getEvaluationsPoller.stop()
        registerEventsPoller.stop()
        reachability.stopNotifier()
    }
}

// MARK: - Start polling

private extension BucketeerSDK {
    func startEvaluationsPolling() {
        DispatchQueue.main.async {
            self.startPollingIfNeeded(self.getEvaluationsPoller)
        }
    }
    
    func startRegisterEventsPolling() {
        DispatchQueue.main.async {
            self.startPollingIfNeeded(self.registerEventsPoller)
        }
    }
    
    func startPollingIfNeeded(_ poller: Poller, applicationState: UIApplication.State = UIApplication.shared.applicationState) {
        #if TEST
        Logger.shared.debugLog("startPolling is suppressed during test")
        #else
        if case .background = applicationState {
            Logger.shared.debugLog("startPolling is suppressed due to background")
        } else {
            poller.start()
        }
        #endif
    }
}
