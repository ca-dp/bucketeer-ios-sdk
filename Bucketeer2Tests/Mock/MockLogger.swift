import Foundation
@testable import Bucketeer2

final class MockLogger: Logger {
    var message: String?
    var error: Error?

    func debug(message: String) {
        self.message = message
    }

    func error(_ error: Error) {
        self.error = error
    }
}
