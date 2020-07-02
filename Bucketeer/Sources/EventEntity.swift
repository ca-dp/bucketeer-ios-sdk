import Foundation
import SwiftProtobuf

/// Wrapper of protobuf-generated class to store in local storage
struct EventEntity: Codable {
    enum EventType: String, Codable {
        case evaluation
        case goal
        case metrics
    }

    let id: String
    let type: EventType
    let data: Data

    init(id: String, type: EventType, data: Data) {
        self.id = id
        self.type = type
        self.data = data
    }

    init?(eventType: EventType, event: Message) {
        let uuid = UUID().uuidString
        self.id = uuid
        self.type = eventType

        do {
            var clientEvent = Bucketeer_Event_Client_Event()
            clientEvent.id = uuid
            clientEvent.event = try Google_Protobuf_Any(message: event)
            self.data = try clientEvent.serializedData()
        } catch {
            Logger.shared.errorLog("\(error.localizedDescription)\n event: \(event)")
            return nil
        }
    }

    static func == (lhs: EventEntity, rhs: EventEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
