import Foundation
@testable import Bucketeer2

struct MockEvaluationInteractor: EvaluationInteractor {
    typealias FetchHandler = (_ user: User, _ timeoutMillis: Int64?, _ completion: ((GetEvaluationsResult) -> Void)?) -> Void

    var fetchHandler: FetchHandler?
    func fetch(user: User, timeoutMillis: Int64?, completion: ((GetEvaluationsResult) -> Void)?) {
        fetchHandler?(user, timeoutMillis, completion)
    }
    func getLatest(userId: String, featureId: String) -> Evaluation? {
        fatalError()
    }
    func refreshCache(userId: String) throws {

    }
    func addUpdateListener(listener: Bucketeer2.EvaluationUpdateListener) -> String {
        return ""
    }

    func removeUpdateListener(key: String) {

    }

    func clearUpdateListeners() {

    }
}
