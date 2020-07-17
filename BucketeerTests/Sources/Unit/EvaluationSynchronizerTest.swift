import Foundation

import XCTest
@testable import Bucketeer

class EvaluationSynchronizerTest: XCTestCase {
    
    private let db = CommonUnitUtil.shared.db
    private let config = CommonUnitUtil.shared.config
    private let userEntity = CommonUnitUtil.shared.userEntity
    private let apiClient = CommonUnitUtil.shared.apiClient
    private let eventStore = CommonUnitUtil.shared.eventStore
    private var latestEvaluationStore: LatestEvaluationStore!
    private var currentEvaluationStore: CurrentEvaluationStore!
    
    override func setUp() {
        super.setUp()
        
        self.resetUserDefaults()

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
    
    func testSyncEvaluations_success() {
        let asyncExpectation = expectation(description: "")
        let evaluationSynchronizer = self.createEvaluationSynchronizer()
        evaluationSynchronizer.syncEvaluations(userEntity: userEntity) { result in
            switch result {
            case .success:
                XCTAssertEqual(evaluationSynchronizer.currentUserEvaluationsId, CommonUnitUtil.shared.userEvaluationsId)
                self.latestEvaluationStore.fetchAll(userID: self.userEntity.id) { result in
                    switch result {
                    case .success(let items):
                        XCTAssertEqual(items.count, 1)
                        XCTAssertEqual(self.latestEvaluationStore.evaluationEntities.count, 1)
                        asyncExpectation.fulfill()
                    case .failure:
                        assertionFailure()
                    }
                }
            default:
                assertionFailure()
            }
        }
        wait(for: [asyncExpectation], timeout: 3)
    }

    func testSyncEvaluations_success_nothing_to_sync() {
        let asyncExpectation = expectation(description: "")
        let evaluationSynchronizer = self.createEvaluationSynchronizer()
        evaluationSynchronizer.updateUserEvaluationsId(userEvaluationsId: CommonUnitUtil.shared.userEvaluationsId)
        evaluationSynchronizer.syncEvaluations(userEntity: userEntity) { result in
            switch result {
            case .success:
                self.latestEvaluationStore.fetchAll(userID: self.userEntity.id) { result in
                    switch result {
                    case .success(let items):
                        XCTAssertEqual(items.count, 0)
                        XCTAssertEqual(self.latestEvaluationStore.evaluationEntities.count, 0)
                        asyncExpectation.fulfill()
                    case .failure:
                        assertionFailure()
                    }
                }
            default:
                assertionFailure()
            }
        }
        wait(for: [asyncExpectation], timeout: 3)
    }

    func testInitUserEvaluationsId() {
        var evaluationSynchronizer = self.createEvaluationSynchronizer()
        XCTAssertEqual(evaluationSynchronizer.currentUserEvaluationsId, "")

        let userEvaluationsId = "user-evaluations-id"
        evaluationSynchronizer.updateUserEvaluationsId(userEvaluationsId: userEvaluationsId)
        evaluationSynchronizer = self.createEvaluationSynchronizer()
        XCTAssertEqual(evaluationSynchronizer.currentUserEvaluationsId, userEvaluationsId)
    }

    func testUpdateUserEvaluationsId() {
        let evaluationSynchronizer = self.createEvaluationSynchronizer()
        let userEvaluationsId = "user-evaluations-id"
        evaluationSynchronizer.updateUserEvaluationsId(userEvaluationsId: userEvaluationsId)
        XCTAssertEqual(evaluationSynchronizer.currentUserEvaluationsId, userEvaluationsId)
    }

    private func createEvaluationSynchronizer() -> EvaluationSynchronizer {
        return EvaluationSynchronizer(
            apiClient: self.apiClient,
            latestEvaluationStore: self.latestEvaluationStore,
            currentEvaluationStore: self.currentEvaluationStore
        )
    }

    private func resetUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.dictionaryRepresentation().keys.forEach{userDefaults.removeObject(forKey:$0)}
    }
}
