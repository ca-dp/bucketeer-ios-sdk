import XCTest
@testable import Bucketeer

class LatestEvaluationStoreTest: XCTestCase {

    private let db = CommonUnitUtil.shared.db
    private let userID = "test001"

    private var latestEvaluationStore: LatestEvaluationStore!

    override func setUp() {
        super.setUp()

        let asyncExpectation = expectation(description: "")

        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)

        queue.async(group: dispatchGroup) {
            dispatchGroup.enter()
            self.latestEvaluationStore = LatestEvaluationStore(db: self.db)
            self.latestEvaluationStore.deleteAll() {
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: queue) {
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testReplaceAll_success_single() {
        let asyncExpectation = expectation(description: "")

        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.userID = "test001"
        evaluation.id = "e001"
        evaluation.featureID = "f001"
        let entity = EvaluationEntity(evaluation: evaluation)!

        latestEvaluationStore.replaceAll(userID: "test001", entities: Set([entity])) { result in
            switch result {
            case .success:
                XCTAssertNotNil(self.latestEvaluationStore.fetch(featureID: "f001"))
                asyncExpectation.fulfill()
             default:
                assertionFailure()
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testReplaceAll_success_multi() {
        let asyncExpectation = expectation(description: "")

        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.userID = "test001"
        evaluation.id = "e001"
        evaluation.featureID = "f001"
        let entity = EvaluationEntity(evaluation: evaluation)!

        var evaluation2 = Bucketeer_Feature_Evaluation()
        evaluation2.userID = "test001"
        evaluation2.id = "e002"
        evaluation2.featureID = "f002"
        let entity2 = EvaluationEntity(evaluation: evaluation2)!

        var evaluation3 = Bucketeer_Feature_Evaluation()
        evaluation3.userID = "test001"
        evaluation3.id = "e003"
        evaluation3.featureID = "f003"
        let entity3 = EvaluationEntity(evaluation: evaluation3)!

        latestEvaluationStore.replaceAll(userID: "test001", entities: Set([entity, entity2, entity3])) { result in
            switch result {
            case .success:
                XCTAssertNotNil(self.latestEvaluationStore.fetch(featureID: "f001"))
                XCTAssertNotNil(self.latestEvaluationStore.fetch(featureID: "f002"))
                XCTAssertNotNil(self.latestEvaluationStore.fetch(featureID: "f003"))
                asyncExpectation.fulfill()
            default:
                assertionFailure()
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }
}
