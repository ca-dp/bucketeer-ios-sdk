import Foundation
import SwiftGRPC

extension CallResult {
    var isFailed: Bool {
        return (!self.success || self.statusCode != .ok)
    }
}
