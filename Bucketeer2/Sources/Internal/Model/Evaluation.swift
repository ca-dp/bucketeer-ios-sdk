import Foundation

struct Evaluation: Hashable, Codable {
    let id: String
    let feature_id: String
    let feature_version: Int
    let user_id: String
    let variation_id: String
    var variation: Variation
    let reason: Reason
    var variation_value: String
}
