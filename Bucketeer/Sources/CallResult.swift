import Foundation
import GRPC

public struct CallResult: CustomStringConvertible {
    public let success: Bool
    public let code: GRPCStatus.Code
    public let message: String?
    
    public static func error(code: GRPCStatus.Code = .unknown, message: String? = nil) -> CallResult {
        return CallResult(
            success: false,
            code: code,
            message: message)
    }
    
    public static func success() -> CallResult {
        return CallResult(
            success: true,
            code: .ok,
            message: "OK")
    }
    
    public init(success: Bool, code: GRPCStatus.Code, message: String?) {
        self.success = success
        self.code = code
        self.message = message
    }
    
    public var description: String {
        var result = "\(success ? "successful" : "unsuccessful"), code \(code)"
        if let message = self.message {
            result += ": " + message
        }
        return result
    }
    
    public var isFailed: Bool {
        return (!self.success || self.code != .ok)
    }
}
