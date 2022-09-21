import Foundation
@testable import Bucketeer2

extension JSON.User {
    static let mock1 = JSON.User(id: "user1", data: ["age": "28"])
    static let mock2 = JSON.User(id: "user2", data: [:])
}
