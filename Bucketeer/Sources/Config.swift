import Foundation

public struct Config {
    
    public let sdkKey: String
    public var apiURL: String
    public var port: Int = 443
    
    public var eventLoopCount: Int = 1
    
    public var logLevel: LogLevel = .none
    public var logPrefix: String = "Bucketeer"
    
    public var requestTimeout: Int64 = 5
    public var tag: String = ""
    
    public var getEvaluationsPollingInterval: TimeInterval = 120_000
    public var registerEventsPollingInterval: TimeInterval = 60_000
    
    public var minEventsPerRequest: Int = 50
    public var maxEventsPerRequest: Int = 100
    
    public init(sdkKey: String, apiURL: String, tag: String = "ios") {
        self.sdkKey = sdkKey
        self.apiURL = apiURL
        self.tag = tag
    }
}
