import Foundation

extension JSON {
    struct User: Codable, Hashable {
        let id: String
        let data: [String: String]
        // note: tagged_data is not used in client SDK
    }
}
