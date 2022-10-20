import Foundation
@testable import Bucketeer2

extension Evaluation {

    /// id: evaluation1 - user: user1, value: string
    static let mock1 = Evaluation(
        id: "evaluation1",
        feature_id: "feature1",
        feature_version: 1,
        user_id: User.mock1.id,
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

    /// id: evaluation2 - user: user1, value: int
    static let mock2 = Evaluation(
        id: "evaluation2",
        feature_id: "feature2",
        feature_version: 1,
        user_id: User.mock1.id,
        variation_id: "variation2",
        variation: .init(
            id: "variation2",
            value: "2",
            name: "name2",
            description: "description2"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule2"
        ),
        variation_value: "2"
    )

    /// id: evaluation3 - user: user2, value: double
    static let mock3 = Evaluation(
        id: "evaluation3",
        feature_id: "feature3",
        feature_version: 1,
        user_id: User.mock2.id,
        variation_id: "variation3",
        variation: .init(
            id: "variation3",
            value: "3.0",
            name: "name3",
            description: "description3"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule3"
        ),
        variation_value: "3.0"
    )

    /// id: evaluation4 - user: user2, value: bool
    static let mock4 = Evaluation(
        id: "evaluation4",
        feature_id: "feature4",
        feature_version: 1,
        user_id: User.mock2.id,
        variation_id: "variation4",
        variation: .init(
            id: "variation4",
            value: "true",
            name: "flag",
            description: "description4"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule4"
        ),
        variation_value: "true"
    )

    /// id: evaluation5 - user: user2, value: json
    static let mock5 = Evaluation(
        id: "evaluation5",
        feature_id: "feature5",
        feature_version: 1,
        user_id: User.mock2.id,
        variation_id: "variation5",
        variation: .init(
            id: "variation5",
            value: "{ \"key\": \"value\" }",
            name: "flag",
            description: "description4"
        ),
        reason: .init(
            type: .rule,
            rule_id: "rule5"
        ),
        variation_value: "{ \"key\": \"value\" }"
    )
}

extension UserEvaluations {
    static let mock1 = UserEvaluations(
        id: "user_evaluation1",
        evaluations: [.mock1, .mock2]
    )

    static let mock2 = UserEvaluations(
        id: "user_evaluation2",
        evaluations: [.mock3, .mock4, .mock5]
    )
}
