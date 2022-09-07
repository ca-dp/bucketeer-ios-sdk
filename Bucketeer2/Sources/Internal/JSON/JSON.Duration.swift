import Foundation

extension JSON {
    struct Duration: Decodable, Hashable {
        let seconds: Int64
        let nanos: Int64
    }
}
