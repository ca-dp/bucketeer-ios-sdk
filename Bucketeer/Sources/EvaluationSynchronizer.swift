import Foundation
import GRPC
import SwiftProtobuf

class EvaluationSynchronizer {
    private let apiClient: APIClientProtocol
    private let latestEvaluationStore: LatestEvaluationStore
    private let currentEvaluationStore: CurrentEvaluationStore
    internal var currentUserEvaluationsId: String
    
    init(apiClient: APIClientProtocol, latestEvaluationStore: LatestEvaluationStore, currentEvaluationStore: CurrentEvaluationStore) {
        self.apiClient = apiClient
        self.latestEvaluationStore = latestEvaluationStore
        self.currentEvaluationStore = currentEvaluationStore
        self.currentUserEvaluationsId = UserDefaults.standard.string(forKey: USER_EVALUATIONS_ID) ?? ""
    }
    
    func syncEvaluations(userEntity: UserEntity, completion: @escaping (Result<Bucketeer_Gateway_GetEvaluationsResponse, BucketeerError>) -> Void) {
        let currentUserEvaluationsId = self.currentUserEvaluationsId
        apiClient.getEvaluations(userEntity: userEntity, userEvaluationsId: currentUserEvaluationsId) { [userEntity, latestEvaluationStore, currentEvaluationStore] result in
            switch result {
            case .success((let response, let callResult)):
                guard let response = response, !callResult.isFailed else {
                    let message = "(\(Version.number)) Failed to getEvaluations: callResult: \(callResult)"
                    Logger.shared.errorLog(message)
                    completion(.failure(.unknown(message)))
                    return
                }
                let entities = Set(response.evaluations.evaluations.compactMap { EvaluationEntity(evaluation: $0) })
                Logger.shared.debugLog("Succeeded to getEvaluations: count: \(entities.count)")
                //  1. LatestStore
                //    - FULL: overwrite all
                //    - PARTIAL: overwrite only received ones
                //  2. CurrentStore
                //    - FULL: delete items, which item's evaluation isn't included in LatestStore
                //    - PARTIAL: -
                switch response.state {
                case .full:
                    let userEvaluationsId = response.userEvaluationsID
                    if currentUserEvaluationsId == userEvaluationsId {
                        Logger.shared.debugLog("Nothing to sync")
                        latestEvaluationStore.fetchInMemoryEvaluations(userID: userEntity.id)
                        completion(.success(response))
                        return
                    }
                    latestEvaluationStore.replaceAll(userID: userEntity.id, entities: entities) { result in
                        switch result {
                        case .success:
                            let validIDs = entities.compactMap { $0.evaluation.id }
                            currentEvaluationStore.deleteUnused(userID: userEntity.id, validIDs: validIDs) {
                                Logger.shared.debugLog("Succeeded to sync evaluations with state: \(response.state)")
                                self.updateUserEvaluationsId(userEvaluationsId: userEvaluationsId)
                                completion(.success(response))
                            }
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                case .partial:
                    latestEvaluationStore.replacePartial(entities: entities) {
                        Logger.shared.debugLog("Succeeded to sync evaluations with state: \(response.state)")
                        completion(.success(response))
                    }
                case .queued:
                    Logger.shared.debugLog("Executed to sync evaluations but state is queued")
                    completion(.success(response))
                case .UNRECOGNIZED(_):
                    let message = "(\(Version.number)) Received UNRECOGNIZED response state"
                    Logger.shared.errorLog(message)
                    completion(.failure(.unknown(message)))
                }
            case .failure(let error):
                let message = "(\(Version.number)) Failed to sync evaluations: \(error.localizedDescription)"
                Logger.shared.errorLog(message)
                latestEvaluationStore.fetchInMemoryEvaluations(userID: userEntity.id)
                completion(.failure(.unknown(message)))
            }
        }
    }
    
    internal func updateUserEvaluationsId(userEvaluationsId: String) {
        self.currentUserEvaluationsId = userEvaluationsId
        UserDefaults.standard.set(userEvaluationsId, forKey: USER_EVALUATIONS_ID)
    }
}
