import Foundation

extension JSON {
    enum EventData: Hashable {
        case goal(Goal)
        case evaluation(Evaluation)
        case metrics(Metrics)

        struct Goal: Codable, Hashable {
            let timestamp: Int64
            let goal_id: String
            let user_id: String
            let value: Double
            let user: User
            let tag: String
            let source_id: SourceID
        }

        struct Evaluation: Codable, Hashable {
            let timestamp: Int64
            let feature_id: String
            var feature_version: Int = 0
            let user_id: String
            var variation_id: String = ""
            let user: User
            let reason: Reason
            let tag: String
            let source_id: SourceID
        }

        struct Metrics: Codable, Hashable {
            let timestamp: Int64
            let event: MetricsEventData
            let type: MetricsEventType

            enum CodingKeys: String, CodingKey {
                case timestamp
                case event
                case type
            }

            init(timestamp: Int64, event: MetricsEventData, type: MetricsEventType) {
                self.timestamp = timestamp
                self.event = event
                self.type = type
            }

            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.timestamp = try container.decode(Int64.self, forKey: .timestamp)
                self.type = try container.decode(MetricsEventType.self, forKey: .type)
                switch self.type {
                case .getEvaluationLatency:
                    let data = try container.decode(MetricsEventData.GetEvaluationLatency.self, forKey: .event)
                    self.event = .getEvaluationLatency(data)
                case .getEvaluationSize:
                    let data = try container.decode(MetricsEventData.GetEvaluationSize.self, forKey: .event)
                    self.event = .getEvaluationSize(data)
                case .timeoutErrorCount:
                    let data = try container.decode(MetricsEventData.TimeoutErrorCount.self, forKey: .event)
                    self.event = .timeoutErrorCount(data)
                case .internalErrorCount:
                    let data = try container.decode(MetricsEventData.InternalErrorCount.self, forKey: .event)
                    self.event = .internalErrorCount(data)
                }
            }

            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(timestamp, forKey: .timestamp)
                try container.encode(type, forKey: .type)
                switch self.event {
                case .getEvaluationLatency(let eventData):
                    try container.encode(eventData, forKey: .event)
                case .getEvaluationSize(let eventData):
                    try container.encode(eventData, forKey: .event)
                case .timeoutErrorCount(let eventData):
                    try container.encode(eventData, forKey: .event)
                case .internalErrorCount(let eventData):
                    try container.encode(eventData, forKey: .event)
                }
            }
        }
    }
}
