import Foundation
import XCTest
@testable import Bucketeer

class BucketeerE2ETest: XCTestCase {

    private let db = CommonUnitUtil.shared.db
    private let eventStore = CommonUnitUtil.shared.eventStore
    private var latestEvaluationStore: LatestEvaluationStore!
    private var currentEvaluationStore: CurrentEvaluationStore!

    override func setUp() {
        super.setUp()

        let userDefaults = UserDefaults.standard
        userDefaults.dictionaryRepresentation().keys.forEach{userDefaults.removeObject(forKey:$0)}

        let asyncExpectation = expectation(description: "")
        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)

        queue.async(group: dispatchGroup) {
            dispatchGroup.enter()
            self.latestEvaluationStore = LatestEvaluationStore(db: self.db)
            self.latestEvaluationStore.deleteAll() {
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            self.currentEvaluationStore = CurrentEvaluationStore(db: self.db)
            self.currentEvaluationStore.deleteAll() {
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            self.eventStore.deleteAll() {
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: queue) {
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testGetEvaluations() {
        let config = CommonE2EUtil.shared.config
        let apiClient = APIClient(config: config)
        let asyncExpectation = expectation(description: "")
        apiClient.getEvaluations(
            userEntity: CommonE2EUtil.shared.userEntity1,
            userEvaluationsId: CommonE2EUtil.shared.userEvaluationsId) { result in
                switch result {
                case .success(let response, let callResult):
                    XCTAssertEqual(callResult.statusCode, .ok)
                    XCTAssertNotNil(response)
                    XCTAssertEqual(response?.state, Bucketeer_Feature_UserEvaluations.State.full)
                    XCTAssertGreaterThanOrEqual(response!.evaluations.evaluations.count, 1)
                    XCTAssertNotEqual(response?.userEvaluationsID, "")
                    asyncExpectation.fulfill()
                case .failure:
                    assertionFailure()
                }
        }
        wait(for: [asyncExpectation], timeout: 10)
    }

    func testRegisterEvents() {
        let config = CommonE2EUtil.shared.config
        let apiClient = APIClient(config: config)
        let eventEntity1 = EventEntity(eventType: .evaluation, event: CommonE2EUtil.shared.evaluationEvent1)!
        let eventEntity2 = EventEntity(eventType: .goal, event: CommonE2EUtil.shared.goalEvent1)!
        let asyncExpectation = expectation(description: "")
        apiClient.registerEvents(eventEntities: [eventEntity1, eventEntity2]) { result in
            switch result {
            case .success(let response, let callResult):
                XCTAssertEqual(callResult.statusCode, .ok)
                XCTAssertEqual(response?.errors.count, 0)
                XCTAssertNotNil(response)
                asyncExpectation.fulfill()
            case .failure:
                assertionFailure()
            }
        }
        wait(for: [asyncExpectation], timeout: 10)
    }

    func testGetVariation() {
        BucketeerSDK.setup(config: CommonE2EUtil.shared.config)
        let asyncExpectation = expectation(description: "")
        BucketeerSDK.shared.setUser(userID: CommonE2EUtil.shared.userID1) { result in
            switch result {
            case .success:
                asyncExpectation.fulfill()
            case .failure:
                assertionFailure()
            }
        }
        wait(for: [asyncExpectation], timeout: 10)
        XCTAssertEqual(BucketeerSDK.shared.stringVariation(featureID: CommonE2EUtil.shared.featureFlagID1, defaultValue: "default"), CommonE2EUtil.shared.featureFlag1Variation)
    }

    func testGetEvaluation() {
        BucketeerSDK.setup(config: CommonE2EUtil.shared.config)
        let asyncExpectation = expectation(description: "")
        BucketeerSDK.shared.setUser(userID: CommonE2EUtil.shared.userID1) { result in
            switch result {
            case .success:
                asyncExpectation.fulfill()
            case .failure:
                assertionFailure()
            }
        }
        wait(for: [asyncExpectation], timeout: 10)
        let evaluation = BucketeerSDK.shared.getEvaluation(featureID: CommonE2EUtil.shared.featureFlagID1)!
        XCTAssertEqual(evaluation.featureID, CommonE2EUtil.shared.featureFlagID1)
        XCTAssertEqual(evaluation.variationValue, CommonE2EUtil.shared.featureFlag1Variation)
        XCTAssertEqual(evaluation.userID, CommonE2EUtil.shared.userID1)
    }
}
