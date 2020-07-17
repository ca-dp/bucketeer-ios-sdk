import Foundation
@testable import Bucketeer

class CommonE2EUtil {
    public static let shared = CommonE2EUtil()
    
    let tag = "ios"
    let userID1 = "bucketeer-ios-user-id-1"
    let featureFlagID1 = "feature-ios-e2e-1"
    let featureFlag1Variation = "value-1"
    let goalID1 = "goal-ios-e2e-1"
    
    let userEntity1: UserEntity
    let userEvaluationsId: String
    let evaluationEvent1: Bucketeer_Event_Client_EvaluationEvent
    let goalEvent1: Bucketeer_Event_Client_GoalEvent
    
    let config: Config
    
    private init() {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "environment", ofType: "plist")!
        let dic = NSDictionary(contentsOfFile: path) as! [String: Any]
        let sdkKey = dic["sdkKey"] as! String
        let apiURL = dic["apiURL"] as! String
        var config = Config(sdkKey: sdkKey, apiURL: apiURL, tag: tag)
        config.requestTimeout = 10
        self.config = config
        
        self.userEntity1 = UserEntity(id: userID1, attributes: [:])!
        self.userEvaluationsId = "user-evaluations-id"
        
        var evaluationEvent1 = Bucketeer_Event_Client_EvaluationEvent()
        evaluationEvent1.timestamp = Int64(Date().timeIntervalSince1970)
        evaluationEvent1.featureID = featureFlagID1
        evaluationEvent1.userID = userID1
        evaluationEvent1.user = userEntity1.user
        self.evaluationEvent1 = evaluationEvent1
        
        var goalEvent1 = Bucketeer_Event_Client_GoalEvent()
        goalEvent1.timestamp = Int64(Date().timeIntervalSince1970)
        goalEvent1.goalID = goalID1
        goalEvent1.userID = userID1
        goalEvent1.user = userEntity1.user
        self.goalEvent1 = goalEvent1
    }
}
