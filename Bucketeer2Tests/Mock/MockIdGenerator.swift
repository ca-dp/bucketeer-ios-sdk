import Foundation
@testable import Bucketeer2

final class MockIdGenerator: IdGenerator {
    let identifier: String
    init(identifier: String) {
        self.identifier = identifier
    }

    func id() -> String {
        return identifier
    }
}

