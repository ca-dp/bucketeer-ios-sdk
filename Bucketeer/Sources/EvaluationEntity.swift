import Foundation
import SwiftProtobuf

/// Wrapper of protobuf-generated class to store in local storage
struct EvaluationEntity: Codable, Hashable {
    let id: String
    let userID: String
    let featureID: String
    let data: Data

    init?(evaluation: Bucketeer_Feature_Evaluation) {
        self.id = evaluation.id
        self.userID = evaluation.userID
        self.featureID = evaluation.featureID
        do {
            self.data = try evaluation.serializedData()
        } catch {
            Logger.shared.errorLog("\(error.localizedDescription)\n evaluation: \(evaluation)")
            return nil
        }
    }

    func hash(into hasher: inout Hasher){
        hasher.combine(id)
    }

    static func == (lhs: EvaluationEntity, rhs: EvaluationEntity) -> Bool {
        return lhs.id == rhs.id
    }

    var evaluation: Bucketeer_Feature_Evaluation {
        return try! Bucketeer_Feature_Evaluation(serializedData: data)
    }
}
