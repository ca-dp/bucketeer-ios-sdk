import Foundation

internal let MINIMUM_FLUSH_INTERVAL_MILLIS: Int64 = 60_000 // 60 seconds
internal let DEFAULT_FLUSH_INTERVAL_MILLIS: Int64 = 60_000 // 60 seconds
internal let DEFAULT_MAX_QUEUE_SIZE: Int = 50
internal let MINIMUM_POLLING_INTERVAL_MILLIS: Int64 = 60_000 // 60 seconds
internal let DEFAULT_POLLING_INTERVAL_MILLIS: Int64 = 600_000 // 10 minutes
internal let MINIMUM_BACKGROUND_POLLING_INTERVAL_MILLIS: Int64 = 1_200_000 // 20 minutes
internal let DEFAULT_BACKGROUND_POLLING_INTERVAL_MILLIS: Int64 = 3_600_000 // 1 hour

public struct BKTConfig {
    let apiKey: String
    let endpoint: URL
    let featureTag: String
    let eventsFlushInterval: Int64
    let eventsMaxBatchQueueCount: Int
    let pollingInterval: Int64
    let backgroundPollingInterval: Int64
    let logger: BKTLogger?

    public class Builder {
        private var apiKey: String?
        private var endpoint: String?
        private var featureTag: String?
        private var eventsFlushInterval: Int64 = DEFAULT_FLUSH_INTERVAL_MILLIS
        private var eventsMaxBatchQueueCount: Int = DEFAULT_MAX_QUEUE_SIZE
        private var pollingInterval: Int64 = DEFAULT_POLLING_INTERVAL_MILLIS
        private var backgroundPollingInterval: Int64 = DEFAULT_BACKGROUND_POLLING_INTERVAL_MILLIS
        private var logger: BKTLogger?

        public func apiKey(apiKey: String) -> Builder {
            self.apiKey = apiKey
            return self
        }

        public func endpoint(endpoint: String) -> Builder {
            self.endpoint = endpoint
            return self
        }

        public func featureTag(featureTag: String) -> Builder {
            self.featureTag = featureTag
            return self
        }

        public func eventsFlushInterval(intervalMillis: Int64) -> Builder {
            self.eventsFlushInterval = intervalMillis
            return self
        }

        public func eventsMaxBatchQueueCount(eventsMaxBatchQueueCount: Int) -> Builder {
            self.eventsMaxBatchQueueCount = eventsMaxBatchQueueCount
            return self
        }

        public func pollingInterval(intervalMillis: Int64) -> Builder {
            self.pollingInterval = intervalMillis
            return self
        }

        public func backgroundPollingInterval(intervalMillis: Int64) -> Builder {
            self.backgroundPollingInterval = intervalMillis
            return self
        }

        public func logger(logger: BKTLogger?) -> Builder {
            self.logger = logger
            return self
        }

        public func build() throws -> BKTConfig {
            guard let apiKey = self.apiKey, !apiKey.isEmpty else {
                throw BKTError.illegalArgument(message: "apiKey is required")
            }
            guard let endpoint = self.endpoint, let endpointURL = URL(string: endpoint) else {
                throw BKTError.illegalArgument(message: "endpoint is required")
            }
            guard let featureTag = self.featureTag, !featureTag.isEmpty else {
                throw BKTError.illegalArgument(message: "featureTag is required")
            }

            if self.pollingInterval < MINIMUM_POLLING_INTERVAL_MILLIS {
                logger?.warn(message: "pollingInterval: \(self.pollingInterval) is set but must be above \(MINIMUM_POLLING_INTERVAL_MILLIS)")
                self.pollingInterval = MINIMUM_POLLING_INTERVAL_MILLIS
            }
            if self.backgroundPollingInterval < MINIMUM_BACKGROUND_POLLING_INTERVAL_MILLIS {
                logger?.warn(message: "backgroundPollingInterval: \(self.backgroundPollingInterval) is set but must be above \(MINIMUM_BACKGROUND_POLLING_INTERVAL_MILLIS)")
                self.backgroundPollingInterval = MINIMUM_BACKGROUND_POLLING_INTERVAL_MILLIS
            }
            if self.eventsFlushInterval < MINIMUM_FLUSH_INTERVAL_MILLIS {
                logger?.warn(message: "eventsFlushInterval: \(self.backgroundPollingInterval) is set but must be above \(MINIMUM_FLUSH_INTERVAL_MILLIS)")
                self.eventsFlushInterval = DEFAULT_FLUSH_INTERVAL_MILLIS
            }

            return BKTConfig(
                apiKey: apiKey,
                endpoint: endpointURL,
                featureTag: featureTag,
                eventsFlushInterval: eventsFlushInterval,
                eventsMaxBatchQueueCount: eventsMaxBatchQueueCount,
                pollingInterval: pollingInterval,
                backgroundPollingInterval: backgroundPollingInterval,
                logger: logger
            )
        }
    }
}
