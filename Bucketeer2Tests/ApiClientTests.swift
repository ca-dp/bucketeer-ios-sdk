import XCTest
@testable import Bucketeer2

class ApiClientTests: XCTestCase {

    // MARK: - getEvaluations

    func testGetEvaluationsSuccess() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let userEvaluationsId: String = "user_evaluation1"
        let evaluations: [Evaluation] = [.mock1, .mock2]
        let response = GetEvaluationsResponse(data: .init(
            evaluations: .init(
                id: userEvaluationsId,
                evaluations: evaluations
            ),
            user_evaluations_id: userEvaluationsId
        ))
        let data = try JSONEncoder().encode(response)
        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "v1/gateway/evaluations"
        let apiKey = "x:api-key"
        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.url?.path, "/\(path)")
                let requestBody = GetEvaluationsRequestBody(
                    tag: "tag1",
                    user: .mock1,
                    user_evaluations_id: userEvaluationsId,
                    source_id: .ios
                )
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(requestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 201,
                httpVersion: nil,
                headerFields: nil
            )
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.getEvaluations(
            user: .mock1,
            userEvaluationsId: userEvaluationsId) { result in
                switch result {
                case .success(let response):
                    XCTAssertEqual(response.data.evaluations.evaluations, evaluations)
                    XCTAssertEqual(response.data.evaluations.id, userEvaluationsId)
                    XCTAssertEqual(response.data.user_evaluations_id, userEvaluationsId)
                    XCTAssertNotEqual(response.seconds, 0)
                    XCTAssertNotEqual(response.sizeByte, 0)
                    XCTAssertEqual(response.featureTag, "tag1")
                case .failure(let error, _):
                    XCTFail("\(error)")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testGetEvaluationsErrorBody() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let userEvaluationsId: String = "user_evaluation1"
        let errorResponse = ErrorResponse(error: .init(code: 400, message: "invalid parameter"))
        let data = try JSONEncoder().encode(errorResponse)
        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "v1/gateway/evaluations"
        let apiKey = "x:api-key"
        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.url?.path, "/\(path)")

                let requestBody = GetEvaluationsRequestBody(
                    tag: "tag1",
                    user: .mock1,
                    user_evaluations_id: userEvaluationsId,
                    source_id: .ios
                )
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(requestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            )
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.getEvaluations(
            user: .mock1,
            userEvaluationsId: userEvaluationsId) { result in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error, let featureTag):
                    XCTAssertEqual(error, .badRequest(message: "invalid parameter"))
                    XCTAssertEqual(featureTag, "tag1")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - registerEvents

    func testRegisterEventsSuccess() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let events: [Event] = [.mockGoal1, .mockEvaluation1]
        let errors: [String: RegisterEventsResponse.ErrorResponse] = [
            Event.mockEvaluation1.id: .init(retriable: true, message: "error")
        ]
        let response = RegisterEventsResponse(data: .init(errors: errors))
        let data = try JSONEncoder().encode(response)
        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "v1/gateway/events"
        let apiKey = "x:api-key"
        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.url?.path, "/\(path)")

                let requestBody = RegisterEventsRequestBody(
                    events: events
                )
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(requestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 201,
                httpVersion: nil,
                headerFields: nil
            )
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.registerEvents(events: events) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.data.errors, errors)
            case .failure(let error):
                XCTFail("\(error)")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    func testRegisterEventsErrorBody() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let events: [Event] = [.mockGoal1, .mockEvaluation1]
        let errorResponse = ErrorResponse(error: .init(code: 400, message: "invalid parameter"))
        let data = try JSONEncoder().encode(errorResponse)
        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "v1/gateway/events"
        let apiKey = "x:api-key"
        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.url?.path, "/\(path)")

                let requestBody = RegisterEventsRequestBody(
                    events: events
                )
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(requestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            )
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.registerEvents(events: events) { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, .badRequest(message: "invalid parameter"))
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }

    // MARK: - send

    enum SomeError: Error, Equatable {
        case failed
    }
    struct MockRequestBody: Codable, Hashable {
        var value = "body"
    }
    struct MockInvalidRequestBody: Codable, Hashable {
        var value = "body"

        func encode(to encoder: Encoder) throws {
            throw SomeError.failed
        }
    }
    struct MockResponse: Codable, Hashable {
        var value = "response"
    }

    func testSendSuccess() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()
        let mockResponse = MockResponse()
        let data = try JSONEncoder().encode(mockResponse)

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 30)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            ),
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success((let response, _)):
                    XCTAssertEqual(response, mockResponse)
                case .failure(let error):
                    XCTFail("\(error)")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testSendSuccessWithDefaultTimeout() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()
        let mockResponse = MockResponse()
        let data = try JSONEncoder().encode(mockResponse)

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 0.2)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            ),
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            defaultRequestTimeoutMills: 200,
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success((let response, _)):
                    XCTAssertEqual(response, mockResponse)
                case .failure(let error):
                    XCTFail("\(error)")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testSendSuccessWithCustomTimeout() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()
        let mockResponse = MockResponse()
        let data = try JSONEncoder().encode(mockResponse)

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 0.1)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: data,
            response: HTTPURLResponse(
                url: endpoint.appendingPathComponent(path),
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            ),
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            defaultRequestTimeoutMills: 200,
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path,
            timeoutMillis: 100) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success((let response, _)):
                    XCTAssertEqual(response, mockResponse)
                case .failure(let error):
                    XCTFail("\(error)")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testTaskFailureWithoutError() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 30)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: nil,
            response: nil,
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error):
                    guard
                        let error = error as? ResponseError,
                        case .unknown(let urlResponse) = error else {
                        XCTFail()
                        return
                    }
                    XCTAssertNil(urlResponse)
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testTaskFailureWithSomeError() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 30)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: nil,
            response: nil,
            error: SomeError.failed
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error):
                    guard let error = error as? SomeError else {
                        XCTFail()
                        return
                    }
                    XCTAssertEqual(error, .failed)
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testTaskFailureNoURLResponseError() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()
        let mockResponse = MockResponse()
        let data = try JSONEncoder().encode(mockResponse)

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.timeoutInterval, 30)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: data,
            response: nil,
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error):
                    guard
                        let error = error as? ResponseError,
                        case .unknown(let urlResponse) = error else {
                        XCTFail()
                        return
                    }
                    XCTAssertNil(urlResponse)
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testTaskFailureWithUnexpectedErrorResponse() throws {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let mockRequestBody = MockRequestBody()
        let mockResponse = MockResponse()
        let data = try JSONEncoder().encode(mockResponse)

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: { request in
                XCTAssertEqual(request.httpMethod, "POST")
                XCTAssertEqual(request.url?.host, endpoint.host)
                XCTAssertEqual(request.url?.path, "/\(path)")
                XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"], apiKey)
                XCTAssertEqual(request.httpBody, try! JSONEncoder().encode(mockRequestBody))
                expectation.fulfill()
            },
            data: data,
            response: .init(
                url: endpoint.appendingPathComponent(path),
                statusCode: 400,
                httpVersion: nil,
                headerFields: nil
            ),
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error):
                    guard
                        let error = error as? DecodingError,
                        case .keyNotFound(let codingKey, _) = error else {
                        XCTFail()
                        return
                    }
                    XCTAssertEqual(codingKey.stringValue, "error")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }

    func testTaskFailureWithRequestBodyEncodingError() throws {
        let expectation = XCTestExpectation()

        let mockRequestBody = MockInvalidRequestBody()

        let endpoint = URL(string: "https://test.bucketeer.jp")!
        let path = "path"
        let apiKey = "x:api-key"

        let session = MockSession(
            configuration: .default,
            requestHandler: nil,
            data: nil,
            response: nil,
            error: nil
        )
        let api = ApiClientImpl(
            apiEndpoint: endpoint,
            apiKey: apiKey,
            featureTag: "tag1",
            session: session,
            logger: nil
        )
        api.send(
            requestBody: mockRequestBody,
            path: path) { (result: Result<(MockResponse, URLResponse), Error>) in
                switch result {
                case .success:
                    XCTFail()
                case .failure(let error):
                    guard let error = error as? SomeError else {
                        XCTFail()
                        return
                    }
                    XCTAssertEqual(error, .failed)
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 1)
    }
}
