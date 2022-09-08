import Foundation

extension JSON {
    enum MetricsEventData: Hashable {
        case getEvaluationLatency(GetEvaluationLatency)
        case getEvaluationSize(GetEvaluationSize)
        case timeoutErrorCount(TimeoutErrorCount)
        case internalErrorCount(InternalErrorCount)

        struct GetEvaluationLatency: Decodable, Hashable {
            let labels: [String: String]
            let duration: Duration
        }

        struct GetEvaluationSize: Decodable, Hashable {
            let labels: [String: String]
            let size_byte: Int
        }

        struct TimeoutErrorCount: Decodable, Hashable {
            let tag: String
        }

        struct InternalErrorCount: Decodable, Hashable {
            let tag: String
        }
    }
}
