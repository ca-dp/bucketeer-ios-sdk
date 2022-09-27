import Foundation

extension JSON {
    struct UserEvaluations: Codable {
        var id: String
        var evaluations: [Evaluation]
    }
}
