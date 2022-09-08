import Foundation

extension JSON {
    struct UserEvaluations: Decodable {
        let id: String
        let evaluations: [Evaluation]
    }
}
