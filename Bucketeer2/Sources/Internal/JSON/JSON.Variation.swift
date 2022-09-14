import Foundation

extension JSON {
    struct Variation: Codable {
        let id: String
        let value: String
        let name: String?
        let description: String?
    }
}
