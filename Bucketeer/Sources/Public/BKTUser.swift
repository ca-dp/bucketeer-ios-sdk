import Foundation

public struct BKTUser: Equatable {
    public let id: String
    public internal(set) var attributes: [String: String]

    public static func create(id: String, attributes: [String: String]) throws -> BKTUser {
        guard !id.isEmpty else {
            throw BKTError.illegalArgument(message: "The user id is required.")
        }
        return BKTUser(id: id, attributes: attributes)
    }

    init(id: String, attributes: [String: String]) {
        self.id = id
        self.attributes = attributes
    }

    public mutating func customAttributes(_ attributes: [String: String]) {
        self.attributes = attributes
    }
}
