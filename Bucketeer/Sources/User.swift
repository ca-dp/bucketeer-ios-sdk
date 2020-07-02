import Foundation

public struct User {
    public let id: String
    public let data: [String: String]?

    public init(id: String, data: [String: String]?) {
       self.id = id
       self.data = data
   }
}
