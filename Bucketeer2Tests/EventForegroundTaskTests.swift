import XCTest
@testable import Bucketeer2

class EventForegroundTaskTests: XCTestCase {
    func testStart() throws {
        let expectation = self.expectation(description: "")
        expectation.expectedFulfillmentCount = 10
        expectation.assertForOverFulfill = true
        let dispatchQueue = DispatchQueue(label: "default", qos: .default)

        var count: Int = 0
        let interactor = MockEventInteractor { force, completion in
            XCTAssertEqual(force, true)
            completion?(.success(true))
            count += 1
            expectation.fulfill()
        }
        let config = BKTConfig(
            apiKey: "api_key_value",
            apiEndpoint: URL(string: "https://test.bucketeer.jp")!,
            featureTag: "featureTag1",
            eventsFlushInterval: 10,
            eventsMaxBatchQueueCount: 3,
            pollingInterval: 100,
            backgroundPollingInterval: 1000,
            logger: MockLogger()
        )
        let component = MockComponent(
            config: config,
            eventInteractor: interactor
        )
        let task = EventForegroundTask(
            component: component,
            queue: dispatchQueue
        )
        task.start()
        wait(for: [expectation], timeout: 0.1)
    }

    func testStartWithUpdateEvents() throws {
        let expectation = self.expectation(description: "")
        expectation.expectedFulfillmentCount = 1
        expectation.assertForOverFulfill = true
        let dispatchQueue = DispatchQueue(label: "default", qos: .default)

        let interactor = MockEventInteractor { force, completion in
            XCTAssertEqual(force, false)
            completion?(.success(true))
            expectation.fulfill()
        }
        let config = BKTConfig(
            apiKey: "api_key_value",
            apiEndpoint: URL(string: "https://test.bucketeer.jp")!,
            featureTag: "featureTag1",
            eventsFlushInterval: 10,
            eventsMaxBatchQueueCount: 3,
            pollingInterval: 2000,
            backgroundPollingInterval: 1000,
            logger: MockLogger()
        )
        let component = MockComponent(
            config: config,
            eventInteractor: interactor
        )
        let task = EventForegroundTask(
            component: component,
            queue: dispatchQueue
        )
        task.start()
        interactor.eventUpdateListener?.onUpdate(events: [.mockGoal1])
        wait(for: [expectation], timeout: 0.1)
    }

    func testStop() {
        let expectation = self.expectation(description: "")
        expectation.isInverted = true
        expectation.assertForOverFulfill = true
        let dispatchQueue = DispatchQueue(label: "default", qos: .default)

        let interactor = MockEventInteractor(sendEventsHandler: { force, completion in
            // not called
            expectation.fulfill()
        })
        let config = BKTConfig(
            apiKey: "api_key_value",
            apiEndpoint: URL(string: "https://test.bucketeer.jp")!,
            featureTag: "featureTag1",
            eventsFlushInterval: 10,
            eventsMaxBatchQueueCount: 3,
            pollingInterval: 10,
            backgroundPollingInterval: 1000,
            logger: MockLogger()
        )
        let component = MockComponent(
            config: config,
            eventInteractor: interactor
        )
        let task = EventForegroundTask(
            component: component,
            queue: dispatchQueue
        )
        task.start()
        task.stop()
        interactor.eventUpdateListener?.onUpdate(events: [.mockGoal1])
        wait(for: [expectation], timeout: 0.1)
    }
}
