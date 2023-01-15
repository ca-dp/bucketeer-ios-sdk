import Foundation

enum MetricsEventData: Hashable {
    case getEvaluationLatency(GetEvaluationLatency)
    case getEvaluationSize(GetEvaluationSize)
    case timeoutErrorCount(TimeoutErrorCount)
    case internalErrorCount(InternalErrorCount)

    struct GetEvaluationLatency: Codable, Hashable {
        let labels: [String: String]
        let duration: Duration
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.GetEvaluationLatencyMetricsEvent"
    }

    struct GetEvaluationSize: Codable, Hashable {
        let labels: [String: String]
        let size_byte: Int64
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.GetEvaluationSizeMetricsEvent"
    }

    struct TimeoutErrorCount: Codable, Hashable {
        let tag: String
    }

    struct InternalErrorCount: Codable, Hashable {
        let tag: String
    }
}
