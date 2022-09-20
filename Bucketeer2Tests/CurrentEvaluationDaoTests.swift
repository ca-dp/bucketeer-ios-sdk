import XCTest
@testable import Bucketeer2

final class CurrentEvaluationDaoTests: XCTestCase {
    let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("evaluation_test.db")
    var path: String { url.path }

    let mocks: [Evaluation] = [
        Evaluation(
            id: "evaluation1",
            feature_id: "feature1",
            feature_version: 1,
            user_id: "user1",
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
        ),
        Evaluation(
            id: "evaluation2",
            feature_id: "feature2",
            feature_version: 2,
            user_id: "user1",
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
    ]


    override func setUp() {
        super.setUp()

        let db = try! SQLite(path: path, logger: nil)
        let migration = Migration1to2(db: db)
        try! migration.migration()
        let dao = CurrentEvaluationDaoImpl(db: db)
        for mock in mocks {
            try! dao.upsertEvaluation(evaluation: mock)
        }
    }

    override func tearDown() {
        try! FileManager.default.removeItem(at: url)

        super.tearDown()
    }

    func testUpsert() throws {
        let db = try SQLite(path: path, logger: nil)
        let dao = CurrentEvaluationDaoImpl(db: db)
        let evaluation = Evaluation(
            id: "evaluation3",
            feature_id: "feature3",
            feature_version: 3,
            user_id: "user3",
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
        try dao.upsertEvaluation(evaluation: evaluation)
        let evaluations = try dao.getEvaluations(userId: "user3")
        XCTAssertEqual(evaluations.count, 1)
        guard let evaluation = evaluations.first else {
            return
        }
        XCTAssertEqual(evaluation.id, "evaluation3")
        XCTAssertEqual(evaluation.variation.id, "variation3")
        XCTAssertEqual(evaluation.reason.rule_id, "rule3")
    }

    func testDelete() throws {
        let db = try SQLite(path: path, logger: nil)
        let dao = CurrentEvaluationDaoImpl(db: db)
        try dao.deleteNotIn(userId: "user1", featureIds: ["feature1"])

        let evaluations = try dao.getEvaluations(userId: "user1")
        XCTAssertEqual(evaluations.count, 1)
        guard let evaluation = evaluations.first else {
            return
        }
        XCTAssertEqual(evaluation.id, "evaluation1")
        XCTAssertEqual(evaluation.variation.id, "variation1")
        XCTAssertEqual(evaluation.reason.rule_id, "rule1")
    }
}
