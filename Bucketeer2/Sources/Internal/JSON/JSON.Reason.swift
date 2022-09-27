import Foundation

extension JSON {
    struct Reason: Codable, Hashable {
        let type: ReasonType
        var rule_id: String = ""
    }
}
