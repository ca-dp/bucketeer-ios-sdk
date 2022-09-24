import Foundation

protocol ApiClient {
    func getEvaluations(user: JSON.User, userEvaluationsId: String, timeoutMillis: Int64?, completion: ((Result<GetEvaluationsResponse, Error>) -> Void)?)
    func registerEvents(events: [Event], completion: ((Result<RegisterEventsResponse, Error>) -> Void)?)
}

extension ApiClient {
    func getEvaluations(user: JSON.User, userEvaluationsId: String, completion: ((Result<GetEvaluationsResponse, Error>) -> Void)?) {
        getEvaluations(
            user: user,
            userEvaluationsId: userEvaluationsId,
            timeoutMillis: nil,
            completion: completion
        )
    }
}
