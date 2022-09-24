import Foundation

extension JSON {
    struct UserEvaluations: Codable {
        let id: String
        let evaluations: [Evaluation]
    }
}
