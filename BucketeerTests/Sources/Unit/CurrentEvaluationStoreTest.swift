import XCTest
@testable import Bucketeer

class CurrentEvaluationStoreTest: XCTestCase {

    private let db = CommonUnitUtil.shared.db
    private let userID = "test001"
    private var currentEvaluationStore: CurrentEvaluationStore!

    override func setUp() {
        super.setUp()

        let asyncExpectation = expectation(description: "")

        let dispatchGroup = DispatchGroup()
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)

        queue.async(group: dispatchGroup) {
            dispatchGroup.enter()
            self.currentEvaluationStore = CurrentEvaluationStore(db: self.db)
            self.currentEvaluationStore.deleteAll() {
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: queue) {
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testSave_success_single() {
        let asyncExpectation = expectation(description: "")

        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.userID = "test001"
        evaluation.id = "e001"
        evaluation.featureID = "f001"
        let entity = EvaluationEntity(evaluation: evaluation)!

        currentEvaluationStore.save([entity]) {
            self.currentEvaluationStore.fetchAll(userID: "test001") { items in
                XCTAssertEqual(items.count, 1)
                asyncExpectation.fulfill()
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testDelete_success() {
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

        currentEvaluationStore.save([entity, entity2, entity3]) {
            self.currentEvaluationStore.deleteUnused(userID: "test001", validIDs: ["e002"]) {
                self.currentEvaluationStore.fetchAll(userID: "test001") { items in
                    XCTAssertEqual(items.count, 1)
                    XCTAssertEqual(items.first?.id, "e002")
                    asyncExpectation.fulfill()
                }
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testDeleteUnused_success_none() {
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

        currentEvaluationStore.save([entity, entity2, entity3]) {
            self.currentEvaluationStore.deleteUnused(userID: "test001", validIDs: ["e001", "e002", "e003"]) {
                self.currentEvaluationStore.fetchAll(userID: "test001") { items in
                    XCTAssertEqual(items.count, 3)
                    asyncExpectation.fulfill()
                }
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testDeleteUnused_success_chunked() {
        let asyncExpectation = expectation(description: "")

        var entities: [EvaluationEntity] = []
        for i in 1...202 {
            var evaluation = Bucketeer_Feature_Evaluation()
            evaluation.userID = "test001"
            evaluation.id = "e00\(i)"
            evaluation.featureID = "f00\(i)"
            let entity = EvaluationEntity(evaluation: evaluation)!
            entities.append(entity)
        }

        currentEvaluationStore.save(entities) {
            self.currentEvaluationStore.deleteUnused(userID: "test001", validIDs: ["e003"]) {
                self.currentEvaluationStore.fetchAll(userID: "test001") { items in
                    XCTAssertEqual(items.count, 1)
                    XCTAssertEqual(items.first?.id, "e003")
                    asyncExpectation.fulfill()
                }
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }
}
