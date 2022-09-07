//
//  JSON.EventData.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    enum EventData: Hashable {
        case goal(Goal)
        case evaluation(Evaluation)
        case metrics(Metrics)

        struct Goal: Decodable, Hashable {
            let timestamp: Int64
            let goal_id: String
            let user_id: String
            let value: Double
            let user: User
            let tag: String
            let source_id: SourceID
        }

        struct Evaluation: Decodable, Hashable {
            let timestamp: Int64
            let feature_id: String
            let feature_version: Int
            let user_id: String
            let variation_id: String
            let user: User
            let reason: Reason
            let tag: String
            let source_id: SourceID
        }

        struct Metrics: Decodable, Hashable {
            let timestamp: Int64
            let event: MetricsEventData
            let type: MetricsEventType

            enum CodingKeys: String, CodingKey {
                  case timestamp
                  case event
                  case type
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
        }
    }
}
