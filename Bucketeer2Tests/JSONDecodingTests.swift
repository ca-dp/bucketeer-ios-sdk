//
//  JSONDecodingTests.swift
//  Bucketeer2Tests
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import XCTest
@testable import Bucketeer2

class JSONDecodingTests: XCTestCase {

    func testDecodingGoalEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 1,
    "event": {
        "timestamp": 1,
        "goal_id": "goal_1",
        "user_id": "user_1",
        "value": 2,
        "user": {
            "id": "user_1",
            "data": {
                "key_1": "value_1",
                "key_2": "value_2"
            }
        },
        "tag": "tag_1",
        "source_id": 2
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .goal)
        guard case .goal(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.goal_id, "goal_1")
        XCTAssertEqual(eventData.user_id, "user_1")
        XCTAssertEqual(eventData.value, 2)
        XCTAssertEqual(eventData.user.id, "user_1")
        XCTAssertEqual(eventData.user.data["key_1"], "value_1")
        XCTAssertEqual(eventData.user.data["key_2"], "value_2")
        XCTAssertEqual(eventData.tag, "tag_1")
        XCTAssertEqual(eventData.source_id, .ios)
    }

    func testDecodingEvaluationEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 3,
    "event": {
        "timestamp": 1,
        "feature_id": "feature_1",
        "feature_version": 2,
        "user_id": "user_1",
        "variation_id": "variation_1",
        "user": {
            "id": "user_1",
            "data": {
                "key_1": "value_1",
                "key_2": "value_2"
            }
        },
        "reason": {
            "type": 3,
            "rule_id": "rule_1"
        },
        "tag": "tag_1",
        "source_id": 2
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .evaluation)
        guard case .evaluation(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.feature_id, "feature_1")
        XCTAssertEqual(eventData.feature_version, 2)
        XCTAssertEqual(eventData.user_id, "user_1")
        XCTAssertEqual(eventData.variation_id, "variation_1")
        XCTAssertEqual(eventData.user.id, "user_1")
        XCTAssertEqual(eventData.user.data["key_1"], "value_1")
        XCTAssertEqual(eventData.user.data["key_2"], "value_2")
        XCTAssertEqual(eventData.reason.type, .default)
        XCTAssertEqual(eventData.reason.rule_id, "rule_1")
        XCTAssertEqual(eventData.tag, "tag_1")
        XCTAssertEqual(eventData.source_id, .ios)
    }

    func testDecodingMetricsGetEvaluationLatencyEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 4,
    "event": {
        "timestamp": 1,
        "type": 1,
        "event": {
            "labels": {
                "key_1": "value_1",
                "key_2": "value_2",
            },
            "duration": {
                "seconds": 1,
                "nanos": 2
            }
        }
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .metrics)
        guard case .metrics(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.type, .getEvaluationLatency)
        guard case .getEvaluationLatency(let metricsData) = eventData.event else {
            XCTFail("metricsData is invalid")
            return
        }
        XCTAssertEqual(metricsData.labels["key_1"], "value_1")
        XCTAssertEqual(metricsData.labels["key_2"], "value_2")
        XCTAssertEqual(metricsData.duration.seconds, 1)
        XCTAssertEqual(metricsData.duration.nanos, 2)
    }

    func testDecodingMetricsGetEvaluationSizeEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 4,
    "event": {
        "timestamp": 1,
        "type": 2,
        "event": {
            "labels": {
                "key_1": "value_1",
                "key_2": "value_2",
            },
            "size_byte": 1
        }
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .metrics)
        guard case .metrics(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.type, .getEvaluationSize)
        guard case .getEvaluationSize(let metricsData) = eventData.event else {
            XCTFail("metricsData is invalid")
            return
        }
        XCTAssertEqual(metricsData.labels["key_1"], "value_1")
        XCTAssertEqual(metricsData.labels["key_2"], "value_2")
        XCTAssertEqual(metricsData.size_byte, 1)
    }

    func testDecodingMetricsTimeoutErrorCountEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 4,
    "event": {
        "timestamp": 1,
        "type": 3,
        "event": {
            "tag": "tag_1"
        }
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .metrics)
        guard case .metrics(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.type, .timeoutErrorCount)
        guard case .timeoutErrorCount(let metricsData) = eventData.event else {
            XCTFail("metricsData is invalid")
            return
        }
        XCTAssertEqual(metricsData.tag, "tag_1")
    }

    func testDecodingMetricsInternalErrorCountEvent() throws {
        let json = """
{
    "id": "event_1",
    "type": 4,
    "event": {
        "timestamp": 1,
        "type": 4,
        "event": {
            "tag": "tag_1"
        }
    }
}
"""
        guard let data = json.data(using: .utf8) else {
            XCTFail("json is invalid")
            return
        }
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(JSON.Event.self, from: data)
        XCTAssertEqual(decoded.id, "event_1")
        XCTAssertEqual(decoded.type, .metrics)
        guard case .metrics(let eventData) = decoded.event else {
            XCTFail("eventData is invalid")
            return
        }
        XCTAssertEqual(eventData.timestamp, 1)
        XCTAssertEqual(eventData.type, .internalErrorCount)
        guard case .internalErrorCount(let metricsData) = eventData.event else {
            XCTFail("metricsData is invalid")
            return
        }
        XCTAssertEqual(metricsData.tag, "tag_1")
    }
}
