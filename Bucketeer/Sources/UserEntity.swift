import Foundation
import SwiftProtobuf

/// Wrapper of protobuf-generated class
struct UserEntity: Codable {
    let id: String
    private(set) var data: Data // Bucketeer_User_User instance itself. It's different from Bucketeer_User_User's data(= attributes).

    init?(id: String, attributes: [String: String]? = nil) {
        self.id = id
        var user = Bucketeer_User_User()
        user.id = id
        user.data = attributes ?? [:]
        do {
            self.data = try user.serializedData()
        } catch {
            Logger.shared.errorLog("\(error.localizedDescription)\n user: \(user)")
            return nil
        }
    }

    var user: Bucketeer_User_User {
        return try! Bucketeer_User_User(serializedData: data)
    }
}
