import Foundation

public struct Evaluation {

    public let id: String
    public let featureID: String
    public let featureVersion: Int
    public let userID: String
    public let variationID: String
    public let variationValue: String
    public let reason: Int

    public init(
        id: String,
        featureID: String,
        featureVersion: Int,
        userID: String,
        variationID: String,
        variationValue: String,
        reason: Int) {
        
        self.id = id
        self.featureID = featureID
        self.featureVersion = featureVersion
        self.userID = userID
        self.variationID = variationID
        self.variationValue = variationValue
        self.reason = reason
    }
}
