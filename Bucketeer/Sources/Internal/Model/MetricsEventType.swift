import Foundation

enum MetricsEventType: Int, Codable, Hashable {
    case unknownError = 0
    case responseLatency = 1
    case responseSize = 2
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
}
