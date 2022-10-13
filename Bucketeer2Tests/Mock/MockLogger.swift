import Foundation
@testable import Bucketeer2

final class MockLogger: Logger {
    private(set) var debugMessage: String?
    private(set) var warnMessage: String?
    private(set) var error: Error?

    func debug(message: String) {
        self.debugMessage = message
    }

    func warn(message: String) {
        self.warnMessage = message
    }

    func error(_ error: Error) {
        self.error = error
    }
}
