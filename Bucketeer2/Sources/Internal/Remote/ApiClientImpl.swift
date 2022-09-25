import Foundation

final class ApiClientImpl: ApiClient {

    static let DEFAULT_REQUEST_TIMEOUT_MILLIS: Int64 = 30_000

    private let endpoint: URL
    private let apiKey: String
    private let featureTag: String
    private let session: Session
    private let defaultRequestTimeoutMills: Int64
    private let logger: Logger?

    enum ResponseError: Error {
        case unknown(URLResponse?)
        case unacceptableCode(code: Int, response: ErrorResponse?)
    }

    init(endpoint: URL,
         apiKey: String,
         featureTag: String,
         defaultRequestTimeoutMills: Int64 = ApiClientImpl.DEFAULT_REQUEST_TIMEOUT_MILLIS,
         session: Session = URLSession.shared,
         logger: Logger?) {

        self.endpoint = endpoint
        self.apiKey = apiKey
        self.featureTag = featureTag
        self.defaultRequestTimeoutMills = defaultRequestTimeoutMills
        self.session = session
        self.logger = logger
        self.session.configuration.timeoutIntervalForRequest = TimeInterval(self.defaultRequestTimeoutMills)
    }

    func getEvaluations(user: JSON.User, userEvaluationsId: String, timeoutMillis: Int64?, completion: ((Result<GetEvaluationsResponse, Error>) -> Void)?) {
        let startAt = Date()
        let requestBody = GetEvaluationsRequestBody(
            tag: self.featureTag,
            user: user,
            user_evaluations_id: userEvaluationsId,
            source_id: .ios
        )
        let featureTag = self.featureTag
        logger?.debug(message: "[API] Fetch Evaluation: \(requestBody)")
        send(
            requestBody: requestBody,
            path: "v1/gateway/evaluations",
            timeoutMillis: timeoutMillis,
            completion: { (result: Result<(GetEvaluationsResponse, URLResponse), Error>) in
                switch result {
                case .success((var response, let urlResponse)):
                    let endAt = Date()
                    let duration = endAt.timeIntervalSince(startAt)
                    response.seconds = duration
                    let contentLength = urlResponse.expectedContentLength
                    response.sizeByte = contentLength
                    response.featureTag = featureTag
                    completion?(.success(response))
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        )
    }

    func registerEvents(events: [Event], completion: ((Result<RegisterEventsResponse, Error>) -> Void)?) {
        let requestBody = RegisterEventsRequestBody(
            events: events
        )
        logger?.debug(message: "[API] Register events: \(requestBody)")
        send(
            requestBody: requestBody,
            path: "v1/gateway/events",
            completion: { (result: Result<(RegisterEventsResponse, URLResponse), Error>) in
                switch result {
                case .success((let response, _)):
                    completion?(.success(response))
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        )
    }

    func send<RequestBody: Encodable, Response: Decodable>(requestBody: RequestBody, path: String, timeoutMillis: Int64? = nil, completion: ((Result<(Response, URLResponse), Error>) -> Void)?) {

        do {
            let body = try JSONEncoder().encode(requestBody)
            var request = URLRequest(url: endpoint.appendingPathComponent(path))
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = [
                "Authorization": self.apiKey
            ]
            request.httpBody = body
            request.timeoutInterval = TimeInterval(timeoutMillis ?? defaultRequestTimeoutMills) / 1000

            session.task(with: request) { data, urlResponse, error in
                guard let data = data else {
                    guard let error = error else {
                        completion?(.failure(ResponseError.unknown(urlResponse)))
                        return
                    }
                    completion?(.failure(error))
                    return
                }

                guard let urlResponse = urlResponse as? HTTPURLResponse else {
                    completion?(.failure(ResponseError.unknown(urlResponse)))
                    return
                }
                do {
                    guard 200..<300 ~= urlResponse.statusCode else {
                        let response: ErrorResponse? = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        let error = ResponseError.unacceptableCode(code: urlResponse.statusCode, response: response)
                        completion?(.failure(error))
                        return
                    }
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    completion?(.success((response, urlResponse)))
                } catch let error {
                    completion?(.failure(error))
                }
            }
        } catch let error {
            completion?(.failure(error))
        }
    }
}
