import Foundation

extension Date {
    var timestamp: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
}
