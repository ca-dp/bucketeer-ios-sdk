import Foundation

extension JSON {
    struct Reason: Decodable, Hashable {
        let type: ReasonType
        let rule_id: String
    }
}
