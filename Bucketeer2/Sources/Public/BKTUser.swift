import Foundation

public struct BKTUser: Equatable {
    public let id: String
    public internal(set) var attributes: [String: String]

    public func builder() -> Builder {
        return .init()
    }

    public mutating func custom(attributes: [String: String]) {
        self.attributes = attributes
    }

    public class Builder {
        private var id: String?
        private var attributes: [String: String] = [:]

        public func id(_ id: String) -> Builder {
            self.id = id
            return self
        }

        public func custom(attributes: [String: String]) -> Builder {
            self.attributes = attributes
            return self
        }

        public func build() throws -> BKTUser {
            guard let id = self.id, !id.isEmpty else {
                throw BKTError.illegalArgument(message: "The user id is required.")
            }
            return BKTUser(id: id, attributes: attributes)
        }
    }
}
