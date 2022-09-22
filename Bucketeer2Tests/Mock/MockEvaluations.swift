import Foundation
@testable import Bucketeer2

extension Evaluation {

    /// id: evaluation1 - user: user1
    static let mock1 = Evaluation(
        id: "evaluation1",
        feature_id: "feature1",
        feature_version: 1,
        user_id: JSON.User.mock1.id,
        variation_id: "variation1",
        variation: .init(
            id: "variation1",
            value: "value1",
            name: "name1",
            description: "description1"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule1"
        ),
        variation_value: "variation_value1"
    )

    /// id: evaluation2 - user: user1
    static let mock2 = Evaluation(
        id: "evaluation2",
        feature_id: "feature2",
        feature_version: 1,
        user_id: JSON.User.mock1.id,
        variation_id: "variation2",
        variation: .init(
            id: "variation2",
            value: "value2",
            name: "name2",
            description: "description2"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule2"
        ),
        variation_value: "variation_value2"
    )

    /// id: evaluation3 - user: user2
    static let mock3 = Evaluation(
        id: "evaluation3",
        feature_id: "feature3",
        feature_version: 1,
        user_id: JSON.User.mock2.id,
        variation_id: "variation3",
        variation: .init(
            id: "variation3",
            value: "value3",
            name: "name3",
            description: "description3"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule3"
        ),
        variation_value: "variation_value3"
    )
}
