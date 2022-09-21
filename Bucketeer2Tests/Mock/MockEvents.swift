import Foundation
@testable import Bucketeer2

extension Event {
    static let mockGoal1 = Event(
        id: "goal_event1",
        event: .goal(.init(
            timestamp: 1,
            goal_id: "goal1",
            user_id: JSON.User.mock1.id,
            value: 1,
            user: .mock1,
            tag: "tag1",
            source_id: .ios
        )),
        type: .goal
    )

    static let mockGoal2 = Event(
        id: "goal_event2",
        event: .goal(.init(
            timestamp: 1,
            goal_id: "goal2",
            user_id: JSON.User.mock1.id,
            value: 1,
            user: .mock1,
            tag: "tag2",
            source_id: .ios
        )),
        type: .goal
    )

    static let mockEvaluation1 = Event(
        id: "evaluation_event1",
        event: .evaluation(.init(
            timestamp: 1,
            feature_id: "feature1",
            feature_version: 1,
            user_id: JSON.User.mock1.id,
            variation_id: "variation1",
            user: .mock1,
            reason: .init(type: .rule, rule_id: "rule1"),
            tag: "tag1",
            source_id: .ios
        )),
        type: .evaluation
    )

    static let mockEvaluation2 = Event(
        id: "evaluation_event2",
        event: .evaluation(.init(
            timestamp: 1,
            feature_id: "feature2",
            feature_version: 1,
            user_id: JSON.User.mock1.id,
            variation_id: "variation2",
            user: .mock1,
            reason: .init(type: .rule, rule_id: "rule2"),
            tag: "tag2",
            source_id: .ios
        )),
        type: .evaluation
    )

    static let mockMetrics1 = Event(
        id: "metrics_event1",
        event: .metrics(.init(
            timestamp: 1,
            event: .getEvaluationLatency(.init(
                labels: ["tag": "ios", "state": "full"],
                duration: .init(seconds: 2, nanos: 2)
            )),
            type: .getEvaluationLatency
        )),
        type: .metrics
    )
}
