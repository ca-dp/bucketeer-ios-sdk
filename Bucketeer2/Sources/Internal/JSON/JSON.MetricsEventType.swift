import Foundation

extension JSON {
    enum MetricsEventType: Int, Codable, Hashable {
        case getEvaluationLatency = 1
        case getEvaluationSize = 2
        case timeoutErrorCount = 3
        case internalErrorCount = 4
    }
}
