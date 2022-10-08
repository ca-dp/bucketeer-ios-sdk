import Foundation

public protocol BKTClient {
    func stringVariation(featureId: String, defaultValue: String) -> String
    func intVariation(featureId: String, defaultValue: Int) -> Int
    func doubleVariation(featureId: String, defaultValue: Double) -> Double
    func boolVariation(featureId: String, defaultValue: Bool) -> Bool
    func jsonVariation(featureId: String, defaultValue: Any) -> Any
    func track(goalId: String, value: Double)
    func currentUser() -> BKTUser?
    func updateUserAttributes(attributes: [String: String])
    func fetchEvaluations(timeoutMillis: Int64?, completion: ((BKTError?) -> Void)?)
    func flush(completion: ((BKTError?) -> Void)?)
    func evaluationDetails(featureId: String, completion: ((BKTEvaluation?) -> Void)?)
}

extension BKTClient {
    public static func initialize(config: BKTConfig, user: BKTUser) {
        guard BKTClientImpl.default == nil else {
            config.logger?.warn(message: "BKTClient is already initialized. not sure if initial fetch has been finished")
            return
        }
        do {
            let dispatchQueue = DispatchQueue(label: "jp.co.cyberagent.bucketeer.taskQueue")
            let client = try BKTClientImpl(config: config, user: user, dispatchQueue: dispatchQueue)
            BKTClientImpl.default = client
        } catch let error {
            config.logger?.error(error)
        }
    }
}

final class BKTClientImpl {
    static var `default`: BKTClientImpl!

    let component: Component
    let dispatchQueue: DispatchQueue
    private(set) var taskScheduler: TaskScheduler?

    init(config: BKTConfig, user: BKTUser, dispatchQueue: DispatchQueue) throws {
        self.dispatchQueue = dispatchQueue
        let dataModule = try DataModuleImpl(user: user.toUser(), config: config)
        self.component = ComponentImpl(dataModule: dataModule)
    }

    func getVariationValue<T>(featureId: String, defaultValue: T) -> T {
        component.config.logger?.debug(message: "BKTClient.getVariation(featureId = \(featureId), defaultValue = \(defaultValue) called")
        let raw = component.evaluationInteractor.getLatest(
            userId: component.userHolder.userId,
            featureId: featureId
        )
        let user = component.userHolder.user
        let featureTag = component.config.featureTag
        guard let raw = raw else {
            execute {
                try self.component.eventInteractor.trackDefaultEvaluationEvent(
                    featureTag: featureTag,
                    user: user,
                    featureId: featureId
                )
            }
            return defaultValue
        }
        execute {
            try self.component.eventInteractor.trackEvaluationEvent(
                featureTag: featureTag,
                user: user,
                evaluation: raw
            )
        }
        return raw.getVariationValue(
            defaultValue: defaultValue,
            logger: component.config.logger
        )
    }

    private func scheduleTasks() {
        self.taskScheduler = TaskScheduler(component: component, dispatchQueue: dispatchQueue)
    }

    private func resetTasks() {
        taskScheduler?.stop()
        taskScheduler = nil
    }

    private func refreshCache() {
        do {
            try component.evaluationInteractor.refreshCache(userId: component.userHolder.userId)
        } catch let error {
            component.config.logger?.error(error)
        }
    }

    private func execute(_ handler: @escaping () throws -> Void) {
        dispatchQueue.async {
            do {
                try handler()
            } catch let error {
                self.component.config.logger?.error(error)
            }
        }
    }
}
extension BKTClientImpl: BKTClient {
    func stringVariation(featureId: String, defaultValue: String) -> String {
        return getVariationValue(featureId: featureId, defaultValue: defaultValue)
    }

    func intVariation(featureId: String, defaultValue: Int) -> Int {
        return getVariationValue(featureId: featureId, defaultValue: defaultValue)
    }

    func doubleVariation(featureId: String, defaultValue: Double) -> Double {
        return getVariationValue(featureId: featureId, defaultValue: defaultValue)
    }

    func boolVariation(featureId: String, defaultValue: Bool) -> Bool {
        return getVariationValue(featureId: featureId, defaultValue: defaultValue)
    }

    func jsonVariation(featureId: String, defaultValue: Any) -> Any {
        return getVariationValue(featureId: featureId, defaultValue: defaultValue)
    }

    func track(goalId: String, value: Double) {
        let user = component.userHolder.user
        let featureTag = component.config.featureTag
        execute {
            try self.component.eventInteractor.trackGoalEvent(
                featureTag: featureTag,
                user: user,
                goalId: goalId,
                value: value
            )
        }
    }

    func currentUser() -> BKTUser? {
        component.userHolder.user.toBKTUser()
    }

    func updateUserAttributes(attributes: [String : String]) {
        component.userHolder.updateAttributes { _ in
            attributes
        }
    }

    func fetchEvaluations(timeoutMillis: Int64?, completion: ((BKTError?) -> Void)?) {
        execute {
            Self.fetchEvaluationsSync(
                component: self.component,
                dispatchQueue: self.dispatchQueue,
                timeoutMillis: timeoutMillis,
                completion: completion
            )
        }
    }

    func flush(completion: ((BKTError?) -> Void)?) {
        execute {
            Self.flushSync(
                component: self.component,
                completion: completion
            )
        }
    }

    func evaluationDetails(featureId: String, completion: ((BKTEvaluation?) -> Void)?) {
        let userId = self.component.userHolder.userId
        execute {
            let evaluation = self.component.evaluationInteractor.getLatest(userId: userId, featureId: featureId)
            guard let evaluation = evaluation else {
                completion?(nil)
                return
            }
            let bktEvaluation = BKTEvaluation(
                id: evaluation.id,
                featureId: evaluation.feature_id,
                featureVersion: evaluation.feature_version,
                userId: evaluation.user_id,
                variationId: evaluation.variation_id,
                variationValue: evaluation.variation_value,
                reason: evaluation.reason.type
            )
            completion?(bktEvaluation)
        }
    }

    static func fetchEvaluationsSync(
        component: Component,
        dispatchQueue: DispatchQueue,
        timeoutMillis: Int64?,
        completion: ((BKTError?) -> Void)?
      ) {
          component.evaluationInteractor.fetch(user: component.userHolder.user, timeoutMillis: timeoutMillis, completion: { result in
              dispatchQueue.async {
                  do {
                      let interactor = component.eventInteractor
                      switch result {
                      case .success(let response):
                          try interactor.trackFetchEvaluationsSuccess(
                            featureTag: response.featureTag,
                            seconds: Int64(response.seconds),
                            sizeByte: response.sizeByte
                          )
                          completion?(nil)
                      case .failure(let error, let featureTag):
                          try interactor.trackFetchEvaluationsFailure(
                            featureTag: featureTag,
                            error: error
                          )
                          completion?(error)
                      }
                  } catch let error {
                      component.config.logger?.error(error)
                      completion?(error as? BKTError)
                  }
              }
          })
      }

    static func flushSync(component: Component, completion: ((BKTError?) -> Void)?){
        component.eventInteractor.sendEvents(force: true) { result in
            switch result {
            case .success:
                completion?(nil)
            case .failure(let error):
                completion?(error)
            }
        }
    }
}
