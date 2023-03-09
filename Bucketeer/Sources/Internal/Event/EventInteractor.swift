import Foundation

protocol EventInteractor {
    func set(eventUpdateListener: EventUpdateListener?)
    func trackEvaluationEvent(featureTag: String, user: User, evaluation: Evaluation) throws
    func trackDefaultEvaluationEvent(featureTag: String, user: User, featureId: String) throws
    func trackGoalEvent(featureTag: String, user: User, goalId: String, value: Double) throws
    func trackFetchEvaluationsSuccess(featureTag: String, seconds: Int64, sizeByte: Int64) throws
    func trackFetchEvaluationsFailure(featureTag: String, error: BKTError) throws
    func sendEvents(force: Bool, completion: ((Result<Bool, BKTError>) -> Void)?)
}

extension EventInteractor {
    func sendEvents(completion: ((Result<Bool, BKTError>) -> Void)?) {
        self.sendEvents(force: false, completion: completion)
    }
}

final class EventInteractorImpl: EventInteractor {
    let sdkVersion: String
    let eventsMaxBatchQueueCount: Int
    let apiClient: ApiClient
    let eventDao: EventDao
    let clock: Clock
    let idGenerator: IdGenerator
    let logger: Logger?

    private let metadata: [String: String]

    private var eventUpdateListener: EventUpdateListener?

    init(sdkVersion: String, appVersion: String, device: Device, eventsMaxBatchQueueCount: Int, apiClient: ApiClient, eventDao: EventDao, clock: Clock, idGenerator: IdGenerator, logger: Logger?) {
        self.sdkVersion = sdkVersion
        self.eventsMaxBatchQueueCount = eventsMaxBatchQueueCount
        self.apiClient = apiClient
        self.eventDao = eventDao
        self.clock = clock
        self.idGenerator = idGenerator
        self.logger = logger
        self.metadata = [
            "app_version": appVersion,
            "os_version": device.osVersion,
            "device_model": device.model,
            "device_type": device.type
        ]
    }

    func set(eventUpdateListener: EventUpdateListener?) {
        self.eventUpdateListener = eventUpdateListener
    }

    func trackEvaluationEvent(featureTag: String, user: User, evaluation: Evaluation) throws {
        try eventDao.add(
            event: .init(
                id: idGenerator.id(),
                event: .evaluation(.init(
                    timestamp: clock.currentTimeSeconds,
                    featureId: evaluation.featureId,
                    featureVersion: evaluation.featureVersion,
                    userId: user.id,
                    variationId: evaluation.variationId,
                    user: user,
                    reason: evaluation.reason,
                    tag: featureTag,
                    sourceId: .ios,
                    sdkVersion: sdkVersion,
                    metadata: metadata
                )),
                type: .evaluation
            )
        )
        updateEventsAndNotify()
    }

    func trackDefaultEvaluationEvent(featureTag: String, user: User, featureId: String) throws {
        try eventDao.add(
            event: .init(
                id: idGenerator.id(),
                event: .evaluation(.init(
                    timestamp: clock.currentTimeSeconds,
                    featureId: featureId,
                    userId: user.id,
                    user: user,
                    reason: .init(type: .client),
                    tag: featureTag,
                    sourceId: .ios,
                    sdkVersion: sdkVersion,
                    metadata: metadata
                )),
                type: .evaluation
            )
        )
        updateEventsAndNotify()
    }

    func trackGoalEvent(featureTag: String, user: User, goalId: String, value: Double) throws {
        try eventDao.add(
            event: .init(
                id: idGenerator.id(),
                event: .goal(.init(
                    timestamp: clock.currentTimeSeconds,
                    goalId: goalId,
                    userId: user.id,
                    value: value,
                    user: user,
                    tag: featureTag,
                    sourceId: .ios,
                    sdkVersion: sdkVersion,
                    metadata: metadata
                )),
                type: .goal
            )
        )
        updateEventsAndNotify()
    }

    func trackFetchEvaluationsSuccess(featureTag: String, seconds: Int64, sizeByte: Int64) throws {
        try eventDao.add(
            events: [
                .init(
                    id: idGenerator.id(),
                    event: .metrics(.init(
                        timestamp: clock.currentTimeSeconds,
                        event: .getEvaluationLatency(.init(
                            apiId: .getEvaluations,
                            labels: ["tag": featureTag],
                            duration: .init(seconds: seconds)
                        )),
                        type: .getEvaluationLatency,
                        sdk_version: sdkVersion,
                        metadata: metadata
                    )),
                    type: .metrics
                ),
                .init(
                    id: idGenerator.id(),
                    event: .metrics(.init(
                        timestamp: clock.currentTimeSeconds,
                        event: .getEvaluationSize(.init(
                            apiId: .getEvaluations,
                            labels: ["tag": featureTag],
                            size_byte: sizeByte
                        )),
                        type: .getEvaluationSize,
                        sdk_version: sdkVersion,
                        metadata: metadata
                    )),
                    type: .metrics
                ),
            ]
        )
        updateEventsAndNotify()
    }

    func trackFetchEvaluationsFailure(featureTag: String, error: BKTError) throws {
        let metricsEventData: MetricsEventData
        let metricsEventType: MetricsEventType
        switch error {
        case .timeout:
            metricsEventData = .timeoutError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .timeoutError
        case .network:
            metricsEventData = .networkError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .networkError
        case .badRequest:
            metricsEventData = .badRequestError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .badRequestError
        case .unauthorized:
            metricsEventData = .unauthorizedError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .unauthorizedError
        case .forbidden:
            metricsEventData = .forbiddenError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .forbiddenError
        case .apiServer:
            metricsEventData = .internalServerError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .internalServerError
        case .unknown:
            metricsEventData = .unknownError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .unknownError
        default:
            metricsEventData = .internalSdkError(.init(apiId: .getEvaluations, labels: ["tag": featureTag]))
            metricsEventType = .internalError
        }
        try eventDao.add(event: .init(
            id: idGenerator.id(),
            event: .metrics(.init(
                timestamp: clock.currentTimeSeconds,
                event: metricsEventData,
                type: metricsEventType,
                sdk_version: sdkVersion,
                metadata: metadata
            )),
            type: .metrics
        ))
        updateEventsAndNotify()
    }

    func sendEvents(force: Bool, completion: ((Result<Bool, BKTError>) -> Void)?) {
        do {
            let currentEvents = try eventDao.getEvents()
            guard !currentEvents.isEmpty else {
                logger?.debug(message: "no events to register")
                completion?(.success(false))
                return
            }

            guard force || currentEvents.count >= eventsMaxBatchQueueCount else {
                logger?.debug(message: "event count is less than threshold - current: \(currentEvents.count), threshold: \(eventsMaxBatchQueueCount)")
                completion?(.success(false))
                return
            }
            let sendingEvents: [Event] = Array(currentEvents.prefix(eventsMaxBatchQueueCount))
            apiClient.registerEvents(events: sendingEvents) { [weak self] result in
                switch result {
                case .success(let response):
                    let errors = response.errors
                    let deletedIds: [String] = sendingEvents
                        .map { $0.id }
                        .filter({ eventId -> Bool in
                            guard let error = errors[eventId] else {
                                // if the event does not contain in error, delete it
                                return true
                            }
                            // if the error is not retriable, delete it
                            return !error.retriable
                    })
                    do {
                        try self?.eventDao.delete(ids: deletedIds)
                        self?.updateEventsAndNotify()
                        completion?(.success(true))
                    } catch let error {
                        completion?(.failure(BKTError(error: error)))
                    }
                case .failure(let error):
                    completion?(.failure(BKTError(error: error)))
                }
            }
        } catch let error {
            completion?(.failure(BKTError(error: error)))
        }
    }

    private func updateEventsAndNotify() {
        do {
            eventUpdateListener?.onUpdate(events: try eventDao.getEvents())
        } catch let error {
            logger?.error(error)
        }
    }
}

protocol EventUpdateListener {
    func onUpdate(events: [Event])
}
