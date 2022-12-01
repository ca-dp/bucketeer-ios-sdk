import Foundation

struct Reason: Codable, Hashable {
    let type: ReasonType
    var rule_id: String? = ""
}
