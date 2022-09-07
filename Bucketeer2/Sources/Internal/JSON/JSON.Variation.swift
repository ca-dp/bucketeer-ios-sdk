import Foundation

extension JSON {
    struct Variation: Decodable {
        let id: String
        let value: String
        let name: String?
        let description: String?
    }
}
