import Foundation
import XCTest
import Bucketeer2

final class BucketeerE2ETests: XCTestCase {

    private var config: BKTConfig!

    override func setUp() async throws {
        try await super.setUp()

        UserDefaults.standard.removeObject(forKey: "bucketeer_user_evaluations_id")

        let config = try BKTConfig.e2e()
        let user = try BKTUser.create(
            id: USER_ID,
            attributes: [:]
        )
        try await BKTClient.initialize(
            config: config,
            user: user
        )
    }

    override func tearDown() async throws {
        try await super.tearDown()

        BKTClient.destroy()
        UserDefaults.standard.removeObject(forKey: "bucketeer_user_evaluations_id")
        try FileManager.default.removeItem(at: .database)
    }

    func testStringVariation() {
        let client = BKTClient.shared
        XCTAssertEqual(client.stringVariation(featureId: FEATURE_ID_STRING, defaultValue: ""), "value-1")
    }

    func testStringVariationDetail() async throws {
        let client = BKTClient.shared
        let actual = await client.evaluationDetails(featureId: FEATURE_ID_STRING)

        assertEvaluation(actual: actual, expected: .init(
            id: "feature-ios-e2e-string:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_STRING,
            featureVersion: 2,
            variationId: "b63d70cc-14ed-438d-9e66-edeed1c56a3b",
            variationValue: "value-1",
            reason: .default
        ))
    }

    func testIntVariation() {
        let client = BKTClient.shared
        XCTAssertEqual(client.intVariation(featureId: FEATURE_ID_INT, defaultValue: 0), 10)
    }

    func testIntVariationDetail() async throws {
        let client = BKTClient.shared
        let actual = await client.evaluationDetails(featureId: FEATURE_ID_INT)

        assertEvaluation(actual: actual, expected: .init(
            id: "feature-ios-e2e-int:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_INT,
            featureVersion: 2,
            variationId: "06a029cf-d57b-49cf-8afb-bf91b9748847",
            variationValue: "10",
            reason: .default
        ))
    }

    func testDoubleVariation() {
        let client = BKTClient.shared
        XCTAssertEqual(client.doubleVariation(featureId: FEATURE_ID_DOUBLE, defaultValue: 0.1), 1.1)
    }

    func testDoubleVariationDetail() async throws {
        let client = BKTClient.shared
        let actual = await client.evaluationDetails(featureId: FEATURE_ID_DOUBLE)

        assertEvaluation(actual: actual, expected: .init(
            id: "feature-ios-e2e-double:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_DOUBLE,
            featureVersion: 2,
            variationId: "35baf767-6a89-4fea-b0e1-0dba39d21521",
            variationValue: "1.1",
            reason: .default
        ))
    }

    func testBoolVariation() {
        let client = BKTClient.shared
        XCTAssertEqual(client.boolVariation(featureId: FEATURE_ID_BOOLEAN, defaultValue: false), true)
    }

    func testBoolVariationDetail() async throws {
        let client = BKTClient.shared
        let actual = await client.evaluationDetails(featureId: FEATURE_ID_BOOLEAN)

        assertEvaluation(actual: actual, expected: .init(
            id: "feature-ios-e2e-bool:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_BOOLEAN,
            featureVersion: 2,
            variationId: "fb00a0a5-9517-4ff8-ae0a-e0b569601c44",
            variationValue: "true",
            reason: .default
        ))
    }

    func testJSONVariation() {
        let client = BKTClient.shared
        let json = client.jsonVariation(featureId: FEATURE_ID_JSON, defaultValue: [:])
        XCTAssertEqual(json as? [String: String], ["key": "value-1"])
    }

    func testJSONVariationDetail() async throws {
        let client = BKTClient.shared
        let actual = await client.evaluationDetails(featureId: FEATURE_ID_JSON)

        assertEvaluation(actual: actual, expected: .init(
            id: "feature-ios-e2e-json:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_JSON,
            featureVersion: 2,
            variationId: "41b31ad3-0316-4877-85c3-1e38cd2b2c1f",
            variationValue: "{ \"key\": \"value-1\" }",
            reason: .default
        ))
    }

    func testEvaluationUpdateFlow() async throws {
        let client = BKTClient.shared
        XCTAssertEqual(client.stringVariation(featureId: FEATURE_ID_STRING, defaultValue: ""), "value-1")

        client.updateUserAttributes(attributes: ["app_version": "0.0.1"])

        try await client.fetchEvaluations(timeoutMillis: nil)
        XCTAssertEqual(client.stringVariation(featureId: FEATURE_ID_STRING, defaultValue: ""), "value-2")

        let details = await client.evaluationDetails(featureId: FEATURE_ID_STRING)
        assertEvaluation(actual: details, expected: .init(
            id: "feature-ios-e2e-string:2:bucketeer-ios-user-id-1",
            featureId: FEATURE_ID_STRING,
            featureVersion: 2,
            variationId: "c15da7c0-7e09-483c-a73a-d2ec605b8334",
            variationValue: "value-2",
            reason: .rule
        ))
    }

    func testTrack() async throws {
        let client = BKTClient.shared
        client.assert(expectedEventCount: 2)
        client.track(goalId: GOAL_ID, value: GOAL_VALUE)
        client.assert(expectedEventCount: 3)
        try await client.flush()
        client.assert(expectedEventCount: 0)
    }
}
