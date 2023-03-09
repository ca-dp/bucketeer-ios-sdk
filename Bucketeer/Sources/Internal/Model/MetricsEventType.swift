import Foundation

enum MetricsEventType: Int, Codable, Hashable {
    case getEvaluationLatency = 1
    case getEvaluationSize = 2
//    case timeoutErrorCount = 3 // deprecated
//    case internalErrorCount = 4 // deprecated
    case timeoutError = 5
    case networkError = 6
    case internalError = 7
    case badRequestError = 8
    case unauthorizedError = 9
    case forbiddenError = 10
    case internalServerError = 11
    case unknownError = 12
}
