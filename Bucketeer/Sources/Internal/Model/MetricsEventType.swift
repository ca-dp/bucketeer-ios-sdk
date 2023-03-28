import Foundation

enum MetricsEventType: Int, Codable, Hashable {
    case responseLatency = 1
    case getEvaluationSize = 2
//    case timeoutErrorCount = 3 // deprecated
//    case internalErrorCount = 4 // deprecated
    case timeoutError = 5
    case networkError = 6
    case internalError = 7
    case badRequestError = 8
    case unauthorizedError = 9
    case forbiddenError = 10
    case notFoundError = 11
    case clientClosedError = 12
    case unavailableError = 13
    case internalServerError = 14
    case unknownError = 15
}
