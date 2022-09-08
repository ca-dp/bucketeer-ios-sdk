import Foundation

extension JSON {
    enum MetricsEventType: Int, Decodable, Hashable {
        case getEvaluationLatency = 1
        case getEvaluationSize = 2
        case timeoutErrorCount = 3
        case internalErrorCount = 4
    }
}
