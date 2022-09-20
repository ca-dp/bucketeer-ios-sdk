import Foundation

extension JSON {
    struct Duration: Codable, Hashable {
        let seconds: Int64
        let nanos: Int64
    }
}
