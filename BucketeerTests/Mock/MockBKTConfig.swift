import Foundation
@testable import Bucketeer

extension BKTConfig {
    static let mock1 = BKTConfig(
        apiKey: "api_key_value",
        apiEndpoint: URL(string: "https://test.bucketeer.jp")!,
        featureTag: "featureTag1",
        eventsFlushInterval: Constant.DEFAULT_FLUSH_INTERVAL_MILLIS,
        eventsMaxBatchQueueCount: Constant.DEFAULT_MAX_QUEUE_SIZE,
        pollingInterval: Constant.DEFAULT_POLLING_INTERVAL_MILLIS,
        backgroundPollingInterval: Constant.DEFAULT_BACKGROUND_POLLING_INTERVAL_MILLIS,
        logger: MockLogger()
    )
}
