import Foundation

extension JSON {
    struct Evaluation: Decodable {
        let id: String
        let feature_id: String
        let feature_version: Int
        let user_id: String
        let variation_id: String
        let variation: Variation
        let reason: Reason
        let variation_value: String
    }
}
