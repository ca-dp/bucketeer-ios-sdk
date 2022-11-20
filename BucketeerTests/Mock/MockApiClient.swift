import Foundation
@testable import Bucketeer

final class MockApiClient: ApiClient {
    typealias GetEvaluationsHandler = ((User, String, Int64?, ((GetEvaluationsResult) -> Void)?)) -> Void
    typealias RegisterEventsHandler = ([Event], ((Result<RegisterEventsResponse, BKTError>) -> Void)?) -> Void

    let getEvaluationsHandler: GetEvaluationsHandler?
    let registerEventsHandler: RegisterEventsHandler?

    init(getEvaluationsHandler: GetEvaluationsHandler? = nil,
         registerEventsHandler: RegisterEventsHandler? = nil) {

        self.getEvaluationsHandler = getEvaluationsHandler
        self.registerEventsHandler = registerEventsHandler
    }

    func getEvaluations(user: User, userEvaluationsId: String, timeoutMillis: Int64?, completion: ((GetEvaluationsResult) -> Void)?) {
        getEvaluationsHandler?((user, userEvaluationsId, timeoutMillis, completion))
    }

    func registerEvents(events: [Event], completion: ((Result<RegisterEventsResponse, BKTError>) -> Void)?) {
        registerEventsHandler?(events, completion)
    }
}
