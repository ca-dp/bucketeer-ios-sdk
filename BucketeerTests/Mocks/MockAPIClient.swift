import Foundation
import SwiftGRPC
import SwiftProtobuf
@testable import Bucketeer

final class MockAPIClient: APIClientProtocol {

    func getEvaluations(userEntity: UserEntity, userEvaluationsId: String, completion: @escaping (Result<(Bucketeer_Gateway_GetEvaluationsResponse?, CallResult), BucketeerError>) -> Void) {
        var response = Bucketeer_Gateway_GetEvaluationsResponse()
        response.state = .full
        response.userEvaluationsID = CommonUnitUtil.shared.userEvaluationsId
        response.evaluations = self.generateUserEvaluations()

        let callResult = CallResult.success(resultData: Data())
        completion(.success((response, callResult)))
    }

    func registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<(Bucketeer_Gateway_RegisterEventsResponse?, CallResult), BucketeerError>) -> Void) {
        let response = Bucketeer_Gateway_RegisterEventsResponse()
        let callResult = CallResult.success(resultData: Data())
        completion(.success((response, callResult)))
    }

    private func generateUserEvaluations() -> Bucketeer_Feature_UserEvaluations {
        var userEvaluations = Bucketeer_Feature_UserEvaluations()
        userEvaluations.evaluations.append(CommonUnitUtil.shared.evaluation)
        return userEvaluations
    }
}
