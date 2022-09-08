import Foundation

extension JSON {
    struct Event: Decodable, Hashable {
        let id: String
        let event: EventData
        let type: EventType
        // note: environment_namespace is not used in client SDK

        enum CodingKeys: String, CodingKey {
              case id
              case event
              case type
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.type = try container.decode(EventType.self, forKey: .type)
            switch self.type {
            case .goal:
                let data = try container.decode(EventData.Goal.self, forKey: .event)
                self.event = .goal(data)
            case .evaluation:
                let data = try container.decode(EventData.Evaluation.self, forKey: .event)
                self.event = .evaluation(data)
            case .metrics:
                let data = try container.decode(EventData.Metrics.self, forKey: .event)
                self.event = .metrics(data)
            }
        }
    }
}
