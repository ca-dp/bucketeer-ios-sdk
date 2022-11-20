import Foundation

struct GetEvaluationsRequestBody: Codable {
    let tag: String
    let user: User
    let user_evaluations_id: String
    let source_id: SourceID
}
