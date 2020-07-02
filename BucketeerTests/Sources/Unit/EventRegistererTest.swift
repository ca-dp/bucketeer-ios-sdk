import Foundation

import XCTest
@testable import Bucketeer

class EventRegistererTest: XCTestCase {

    private let db = CommonUnitUtil.shared.db
    private let config = CommonUnitUtil.shared.config
    private let userEntity = CommonUnitUtil.shared.userEntity
    private let apiClient = CommonUnitUtil.shared.apiClient
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

    func testRegisterEvents_success() {
        let eventRegisterer = EventRegisterer(apiClient: apiClient, eventStore: eventStore)
        
        let userEntity = UserEntity(id: "001")!

        var evaluationEvent = Bucketeer_Event_Client_EvaluationEvent()
        evaluationEvent.timestamp = Int64(Date().timeIntervalSince1970 * 1000)
        evaluationEvent.featureID = "f001"
        evaluationEvent.featureVersion = 1
        evaluationEvent.userID = userEntity.user.id
        evaluationEvent.variationID = "v001"
        evaluationEvent.user = userEntity.user
        evaluationEvent.reason = Bucketeer_Feature_Reason()
        let eventEntity = EventEntity(eventType: .evaluation, event: evaluationEvent)!
        
        eventRegisterer.registerEvents(eventEntities: [eventEntity]) { result in
            switch result {
            case .success(let callResult):
                XCTAssertNotNil(callResult)
                self.eventStore.fetch { items in
                    XCTAssertEqual(items.count, 0)
                }
            case .failure:
                assertionFailure()
            }
        }
    }
}
