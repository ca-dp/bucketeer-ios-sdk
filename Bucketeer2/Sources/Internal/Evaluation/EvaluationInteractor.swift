import Foundation

final class EvaluationInteractor {

    private static let userEvaluationsIdKey = "bucketeer_user_evaluations_id"

    let apiClient: ApiClient
    let evaluationDao: EvaluationDao
    let defaults: Defaults
    let logger: Logger?

    init(apiClient: ApiClient, evaluationDao: EvaluationDao, defaults: Defaults, logger: Logger? = nil) {
        self.apiClient = apiClient
        self.evaluationDao = evaluationDao
        self.defaults = defaults
        self.logger = logger
    }

    // key: userId
    var evaluations: [String: [Evaluation]] = [:]
    var currentEvaluationsId: String {
        get {
            return defaults.string(forKey: Self.userEvaluationsIdKey) ?? ""
        }
        set {
            defaults.set(newValue, forKey: Self.userEvaluationsIdKey)
        }
    }

    func fetch(user: JSON.User, timeoutMillis: Int64? = nil, completion: ((GetEvaluationsResult) -> Void)?) {
        let currentEvaluationsId = self.currentEvaluationsId
        let evaluationDao = self.evaluationDao
        let logger = self.logger
        apiClient.getEvaluations(
            user: user,
            userEvaluationsId: currentEvaluationsId,
            timeoutMillis: timeoutMillis) { [weak self] result in
                switch result {
                case .success(let response):
                    let newEvaluationsId = response.data.user_evaluations_id
                    if (currentEvaluationsId == newEvaluationsId) {
                        logger?.debug(message: "Nothing to sync")
                        completion?(result)
                        return
                    }
                    let newEvaluations = response.data.evaluations.evaluations
                    do {
                        try evaluationDao.deleteAllAndInsert(userId: user.id, evaluations: newEvaluations)
                    } catch let error {
                        logger?.error(error)
                        completion?(result)
                        return
                    }
                    self?.currentEvaluationsId = newEvaluationsId
                    self?.evaluations[user.id] = newEvaluations
                    completion?(result)
                case .failure:
                    completion?(result)
                }
        }
    }

    func refreshCache(userId: String) throws {
        evaluations[userId] = try evaluationDao.get(userId: userId)
    }

    func getLatest(userId: String, featureId: String) -> Evaluation? {
        let evaluations = evaluations[userId] ?? []
        return evaluations.first(where: { $0.feature_id == featureId })
    }
}
