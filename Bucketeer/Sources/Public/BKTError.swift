import Foundation

public enum BKTError: Error, Equatable {
    case badRequest(message: String)
    case unauthorized(message: String)
    case featureNotFound(message: String)
    case invalidHttpMethod(message: String)
    case apiServer(message: String)

    // network errors
    case timeout(message: String, error: Error)
    case network(message: String, error: Error)

    // sdk errors
    case illegalArgument(message: String)
    case illegalState(message: String)

    // unknown errors
    case unknown(message: String, error: Error)

    public static func == (lhs: BKTError, rhs: BKTError) -> Bool {
        switch (lhs, rhs) {
        case (.badRequest(let m1), .badRequest(let m2)),
            (.unauthorized(let m1), .unauthorized(let m2)),
            (.featureNotFound(let m1), .featureNotFound(let m2)),
            (.invalidHttpMethod(let m1), .invalidHttpMethod(let m2)),
            (.apiServer(let m1), .apiServer(let m2)),
            (.illegalArgument(let m1), .illegalArgument(let m2)),
            (.illegalState(let m1), .illegalState(let m2)):
            return m1 == m2
        case (.timeout(let m1, _), .timeout(let m2, _)),
            (.network(let m1, _), .network(let m2, _)),
            (.unknown(let m1, _), .unknown(let m2, _)):
            return m1 == m2
        default:
            return false
        }
    }
}

extension BKTError {
    internal init(error: Error) {
        if let bktError = error as? BKTError {
            self = bktError
            return
        }

        if let responseError = error as? ResponseError {
            switch responseError {
            case .unacceptableCode(let code, let errorResponse):
                switch code {
                case 400:
                    self = .badRequest(message: errorResponse?.error.message ?? "BadRequest error")
                case 401:
                    self = .unauthorized(message: errorResponse?.error.message ?? "Unauthorized error")
                case 404:
                    self = .featureNotFound(message: errorResponse?.error.message ?? "NotFound error")
                case 405:
                    self = .invalidHttpMethod(message: errorResponse?.error.message ?? "MethodNotAllowed error")
                case 500:
                    self = .apiServer(message: errorResponse?.error.message ?? "InternalServer error")
                default:
                    var message: String = "no error body"
                    if let errorResponse = errorResponse {
                        message = "[\(errorResponse.error.code)] \(errorResponse.error.message)"
                    }
                    self = .unknown(message: "Unknown error: \(message)", error: error)
                }
            case .unknown(let urlResponse):
                var message: String = "no response"
                if let urlResponse = urlResponse as? HTTPURLResponse {
                    message = "[\(urlResponse.statusCode)] \(urlResponse)"
                }
                self = .network(message: "Network connection error: \(message)", error: error)
            }
            return
        }

        let nsError = error as NSError
        if nsError.domain == NSURLErrorDomain,
           nsError.code == NSURLErrorTimedOut {
            self = .timeout(message: "Request timeout error: \(error)", error: error)
        } else {
            self = .unknown(message: "Unknown error: \(error)", error: error)
        }
    }
}
