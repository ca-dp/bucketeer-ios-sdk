import Foundation

enum MetricsEventData: Hashable {
    case getEvaluationLatency(GetEvaluationLatency)
    case getEvaluationSize(GetEvaluationSize)
    case timeoutError(TimeoutError)
    case networkError(NetworkError)
    case badRequestError(BadRequestError)
    case unauthorizedError(UnauthorizedError)
    case forbiddenError(ForbiddenError)
    case internalSdkError(InternalSdkError)
    case internalServerError(InternalServerError)
    case unknownError(UnknownError)

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

    struct BadRequestError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.BadRequestErrorMetricsEvent"
    }

    struct UnauthorizedError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.UnauthorizedErrorMetricsEvent"
    }

    struct ForbiddenError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.ForbiddenErrorMetricsEvent"
    }

    struct InternalSdkError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.InternalSdkErrorMetricsEvent"
    }

    struct InternalServerError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.InternalServerErrorMetricsEvent"
    }

    struct UnknownError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.UnknownErrorMetricsEvent"
    }
}
