import XCTest
@testable import Bucketeer2

final class EvaluationInteractorTests: XCTestCase {

    func testFetchInitialLoad() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 2

        let user_evaluations_id = UserEvaluations.mock1.id
        let api = MockApiClient(
            getEvaluationsHandler: { user, userEvaluationsId, timeoutMillis, completion in

                XCTAssertEqual(user, .mock1)
                XCTAssertEqual(userEvaluationsId, "")

                let response = GetEvaluationsResponse(
                    data: .init(
                        evaluations: .mock1,
                        user_evaluations_id: user_evaluations_id
                    ))
                completion?(.success(response))
                expectation.fulfill()
            }
        )

        let dao = MockEvaluationDao()
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )
        XCTAssertEqual(interactor.currentEvaluationsId, "")
        interactor.fetch(user: .mock1) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.data.user_evaluations_id, user_evaluations_id)
            case .failure(let error, _):
                XCTFail("\(error)")
            }

            XCTAssertEqual(interactor.currentEvaluationsId, user_evaluations_id)
            XCTAssertEqual(interactor.evaluations[User.mock1.id], [.mock1, .mock2])

            let evaluation = interactor.getLatest(
                userId: User.mock1.id,
                featureId: "feature1"
            )
            XCTAssertEqual(evaluation, .mock1)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testFetchUpdate() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 3
        expectation.assertForOverFulfill = true

        let initialEvaluation = Evaluation.mock1
        var updatedEvaluation = initialEvaluation
        updatedEvaluation.variation_value += "_updated"

        let user_evaluations_id = UserEvaluations.mock1.id
        let user_evaluations_id_updated = user_evaluations_id + "_updated"
        let api = MockApiClient(
            getEvaluationsHandler: { user, userEvaluationsId, timeoutMillis, completion in

                XCTAssertEqual(user, .mock1)
                if userEvaluationsId == "" {
                    // initial request
                    let response = GetEvaluationsResponse(
                        data: .init(
                            evaluations: .mock1,
                            user_evaluations_id: user_evaluations_id
                        ))
                    completion?(.success(response))
                } else {
                    // second request
                    var userEvaluations = UserEvaluations.mock1
                    userEvaluations.evaluations = [updatedEvaluation, .mock2]
                    userEvaluations.id = user_evaluations_id_updated
                    let response = GetEvaluationsResponse(
                        data: .init(
                            evaluations: userEvaluations,
                            user_evaluations_id: user_evaluations_id_updated
                        ))
                    completion?(.success(response))
                }

                expectation.fulfill()
            }
        )

        let dao = MockEvaluationDao()
        let defaults = MockDefaults()

        let idGenerator = MockIdGenerator(identifier: "")
        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )
        XCTAssertEqual(interactor.currentEvaluationsId, "")
        // 1st
        interactor.fetch(user: .mock1) { _ in

            // 2nd
            interactor.fetch(user: .mock1) { result in
                switch result {
                case .success(let response):
                    XCTAssertEqual(response.data.user_evaluations_id, user_evaluations_id_updated)
                case .failure(let error, _):
                    XCTFail("\(error)")
                }

                XCTAssertEqual(interactor.currentEvaluationsId, user_evaluations_id_updated)
                XCTAssertEqual(interactor.evaluations[User.mock1.id], [updatedEvaluation, .mock2])

                let evaluation = interactor.getLatest(
                    userId: User.mock1.id,
                    featureId: "feature1"
                )
                XCTAssertEqual(evaluation, updatedEvaluation)

                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }

    func testFetchNoUpdate() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 3
        expectation.assertForOverFulfill = true

        let user_evaluations_id = UserEvaluations.mock1.id
        let api = MockApiClient(
            getEvaluationsHandler: { user, userEvaluationsId, timeoutMillis, completion in

                XCTAssertEqual(user, .mock1)
                let response = GetEvaluationsResponse(
                    data: .init(
                        evaluations: .mock1,
                        user_evaluations_id: user_evaluations_id
                    ))
                completion?(.success(response))
                expectation.fulfill()
            }
        )

        let dao = MockEvaluationDao()
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )
        XCTAssertEqual(interactor.currentEvaluationsId, "")
        // 1st
        interactor.fetch(user: .mock1) { _ in

            // 2nd
            interactor.fetch(user: .mock1) { result in
                switch result {
                case .success(let response):
                    XCTAssertEqual(response.data.user_evaluations_id, user_evaluations_id)
                case .failure(let error, _):
                    XCTFail("\(error)")
                }

                XCTAssertEqual(interactor.currentEvaluationsId, user_evaluations_id)
                XCTAssertEqual(interactor.evaluations[User.mock1.id], [.mock1, .mock2])

                let evaluation = interactor.getLatest(
                    userId: User.mock1.id,
                    featureId: "feature1"
                )
                XCTAssertEqual(evaluation, .mock1)

                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 1)
    }

    func testRefreshCache() throws {
        let api = MockApiClient()

        let userId1 = User.mock1.id
        let userId2 = User.mock2.id

        let dao = MockEvaluationDao(getHandler: { userId in
            switch userId {
            case userId1:
                return [.mock1, .mock2]
            case userId2:
                return [.mock3]
            default:
                return []
            }
        })
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )

        XCTAssertEqual(interactor.evaluations[userId1], nil)
        XCTAssertEqual(interactor.evaluations[userId2], nil)

        try interactor.refreshCache(userId: userId1)
        XCTAssertEqual(interactor.evaluations[userId1], [.mock1, .mock2])

        try interactor.refreshCache(userId: userId2)
        XCTAssertEqual(interactor.evaluations[userId2], [.mock3])
    }

    func testGetLatestWithCache() throws {
        let api = MockApiClient()

        let userId1 = User.mock1.id
        let userId2 = User.mock2.id

        let dao = MockEvaluationDao(getHandler: { userId in
            switch userId {
            case userId1:
                return [.mock1, .mock2]
            case userId2:
                return [.mock3]
            default:
                return []
            }
        })
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )

        try interactor.refreshCache(userId: userId1)

        XCTAssertEqual(interactor.getLatest(userId: userId1, featureId: Evaluation.mock1.feature_id), .mock1)
    }

    func testGetLatestWithoutCache() {
        let api = MockApiClient()

        let dao = MockEvaluationDao(getHandler: { userId in
            return []
        })
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )

        XCTAssertEqual(interactor.getLatest(userId: User.mock1.id, featureId: Evaluation.mock1.feature_id), nil)
    }

    func testGetLatestWithoutCorrespondingEvaluation() {
        let api = MockApiClient()

        let dao = MockEvaluationDao(getHandler: { userId in
            switch userId {
            case User.mock1.id:
                return [.mock1, .mock2]
            default:
                return []
            }
        })
        let defaults = MockDefaults()
        let idGenerator = MockIdGenerator(identifier: "")

        let interactor = EvaluationInteractorImpl(
            apiClient: api,
            evaluationDao: dao,
            defaults: defaults,
            idGenerator: idGenerator
        )

        XCTAssertEqual(interactor.getLatest(userId: User.mock1.id, featureId: "invalid_feature_id"), nil)
    }
}
