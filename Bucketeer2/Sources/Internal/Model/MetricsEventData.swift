import Foundation

enum MetricsEventData: Hashable {
    case getEvaluationLatency(GetEvaluationLatency)
    case getEvaluationSize(GetEvaluationSize)
    case timeoutErrorCount(TimeoutErrorCount)
    case internalErrorCount(InternalErrorCount)

    struct GetEvaluationLatency: Codable, Hashable {
        let labels: [String: String]
        let duration: Duration
    }

    struct GetEvaluationSize: Codable, Hashable {
        let labels: [String: String]
        let size_byte: Int
    }

    struct TimeoutErrorCount: Codable, Hashable {
        let tag: String
    }

    struct InternalErrorCount: Codable, Hashable {
        let tag: String
    }
}
