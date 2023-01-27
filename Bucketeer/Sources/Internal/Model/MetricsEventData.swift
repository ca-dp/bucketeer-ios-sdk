import Foundation

enum MetricsEventData: Hashable {
    case getEvaluationLatency(GetEvaluationLatency)
    case getEvaluationSize(GetEvaluationSize)
    case timeoutError(TimeoutError)
    case networkError(NetworkError)
    case internalSdkError(InternalSdkError)

    struct GetEvaluationLatency: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        let duration: Duration
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.GetEvaluationLatencyMetricsEvent"
    }

    struct GetEvaluationSize: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        let size_byte: Int64
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.GetEvaluationSizeMetricsEvent"
    }

    struct TimeoutError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.TimeoutErrorMetricsEvent"
    }

    struct NetworkError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.NetworkErrorMetricsEvent"
    }

    struct InternalSdkError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.InternalSdkErrorMetricsEvent"
    }
}
