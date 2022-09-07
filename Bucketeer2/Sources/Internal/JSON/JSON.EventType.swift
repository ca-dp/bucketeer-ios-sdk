import Foundation

extension JSON {
    enum EventType: Int, Decodable {
        case goal = 1
        // case goal_batch = 2 not used in Client SDK
        case evaluation = 3
        case metrics = 4
    }
}
