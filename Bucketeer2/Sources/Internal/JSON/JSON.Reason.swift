import Foundation

extension JSON {
    struct Reason: Codable, Hashable {
        let type: ReasonType
        let rule_id: String
    }
}
