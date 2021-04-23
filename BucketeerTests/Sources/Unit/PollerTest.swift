import Foundation
import XCTest
import SwiftProtobuf

@testable import Bucketeer

class PollerTests: XCTestCase {

    func testStart() {
        let asyncExpectation = expectation(description: "")
        let queue = DispatchQueue(label: "queue-test")

        var counter = 0
        let poller = Poller(interval: 1000, queue: queue) {
            print("pollingEvent called")
            counter += 1
        }

        poller.start()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            poller.stop()
            XCTAssertEqual(counter, 3)
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 4)
    }

    func testReset() {
        let asyncExpectation = expectation(description: "")
        let queue = DispatchQueue(label: "queue-test")

        var counter = 0
        let poller = Poller(interval: 1000, queue: queue) {
            print("pollingEvent called")
            counter += 1
        }

        poller.start()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertEqual(counter, 1)

            poller.stop()
            poller.start()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                XCTAssertEqual(counter, 2)
                poller.stop()
                asyncExpectation.fulfill()
            }
        }

        wait(for: [asyncExpectation], timeout: 4)
    }

    func testStartRepeats() {
        let asyncExpectation = expectation(description: "")
        let queue = DispatchQueue(label: "queue-test")

        var counter = 0
        let poller = Poller(interval: 1000, queue: queue) {
            print("pollingEvent called")
            counter += 1
        }

        poller.start()
        poller.start()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            poller.stop()
            XCTAssertEqual(counter, 1)
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }

    func testStopRepeats() {
        let asyncExpectation = expectation(description: "")
        let queue = DispatchQueue(label: "queue-test")

        var counter = 0
        let poller = Poller(interval: 1000, queue: queue) {
            print("pollingEvent called")
            counter += 1
        }

        poller.start()

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            poller.stop()
            poller.stop()
            XCTAssertEqual(counter, 1)
            asyncExpectation.fulfill()
        }

        wait(for: [asyncExpectation], timeout: 3)
    }
}
