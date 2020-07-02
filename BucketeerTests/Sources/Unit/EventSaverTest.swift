import Foundation

import XCTest
@testable import Bucketeer

class EventSaverTest: XCTestCase {

    private let db = CommonUnitUtil.shared.db
    private let config = CommonUnitUtil.shared.config
    private let userEntity = CommonUnitUtil.shared.userEntity
    private let eventStore = CommonUnitUtil.shared.eventStore
    private var latestEvaluationStore: LatestEvaluationStore!
    private var currentEvaluationStore: CurrentEvaluationStore!

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

    func testPushEvaluationsEvent() {
        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.featureID = "f001"
        let entity = EvaluationEntity(evaluation: evaluation)!

        let eventSaver = EventSaver(eventStore: eventStore)

        let asyncExpectation = expectation(description: "")

        eventSaver.saveEvaluationEvent(userEntity: userEntity, evaluationEntity: entity) { count in
            self.eventStore.fetch { items in
                XCTAssertEqual(items.count, 1)
                asyncExpectation.fulfill()
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testPushGoalEvent() {
        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.featureID = "f001"
        let entity1 = EvaluationEntity(evaluation: evaluation)!

        var evaluation2 = Bucketeer_Feature_Evaluation()
        evaluation2.featureID = "f002"
        let entity2 = EvaluationEntity(evaluation: evaluation2)!

        let entities: Set = [entity1, entity2]

        let eventSaver = EventSaver(eventStore: eventStore)

        let asyncExpectation = expectation(description: "")

        eventSaver.saveGoalEvent(userEntity: userEntity, goalID: "g001", value: 1, evaluationEntities: entities) { _ in
            self.eventStore.fetch { items in
                XCTAssertEqual(items.count, 1)
                asyncExpectation.fulfill()
            }
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testPushGetEvaluationLatencyMetricsEvent() {
        let eventSaver = EventSaver(eventStore: eventStore)
        let asyncExpectation = expectation(description: "")
        eventSaver.saveGetEvaluationLatencyMetricsEvent(duration: TimeInterval(0.123), labels: ["tag": "ios", "state": "FULL"]){ _ in
            self.eventStore.fetch { items in
                XCTAssertEqual(items.count, 1)
                asyncExpectation.fulfill()
            }
        }
        wait(for: [asyncExpectation], timeout: 3)
    }

    func testPushGetEvaluationSizeMetricsEvent() {
        let eventSaver = EventSaver(eventStore: eventStore)
        let asyncExpectation = expectation(description: "")
        eventSaver.saveGetEvaluationSizeMetricsEvent(sizeByte: 1234, labels: ["tag": "ios", "state": "FULL"]){ _ in
            self.eventStore.fetch { items in
                XCTAssertEqual(items.count, 1)
                asyncExpectation.fulfill()
            }
        }
        wait(for: [asyncExpectation], timeout: 3)
    }

    func testPushBothEvent() {
        let eventSaver = EventSaver(eventStore: eventStore)

        var evaluation = Bucketeer_Feature_Evaluation()
        evaluation.featureID = "f001"
        let entity1 = EvaluationEntity(evaluation: evaluation)!

        var evaluation2 = Bucketeer_Feature_Evaluation()
        evaluation2.featureID = "f002"
        let entity2 = EvaluationEntity(evaluation: evaluation2)!

        let entities: Set = [entity1, entity2]

        eventSaver.saveEvaluationEvent(userEntity: userEntity, evaluationEntity: entity1)
        eventSaver.saveGoalEvent(userEntity: userEntity, goalID: "g001", value: 1, evaluationEntities: entities)
        eventSaver.saveEvaluationEvent(userEntity: userEntity, evaluationEntity: entity2)

        let asyncExpectation = expectation(description: "")

        eventStore.fetch { items in
            XCTAssertEqual(items.count, 3)
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    // TODO: add test: trigger registerEvents
}
