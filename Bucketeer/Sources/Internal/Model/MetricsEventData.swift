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

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
            hasher.combine(duration)
        }
    }

    struct GetEvaluationSize: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        let size_byte: Int64
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.GetEvaluationSizeMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
            hasher.combine(size_byte)
        }
    }

    struct TimeoutError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.TimeoutErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct NetworkError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.NetworkErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct BadRequestError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.BadRequestErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct UnauthorizedError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.UnauthorizedErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct ForbiddenError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.ForbiddenErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct InternalSdkError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.InternalSdkErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct InternalServerError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.InternalServerErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }

    struct UnknownError: Codable, Hashable {
        let apiId: ApiId
        let labels: [String: String]
        var protobufType: String? = "type.googleapis.com/bucketeer.event.client.UnknownErrorMetricsEvent"

        func hash(into hasher: inout Hasher) {
            hasher.combine(apiId)
        }
    }
}