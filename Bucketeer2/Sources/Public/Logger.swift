import Foundation

public protocol Logger {
    func debug(message: String)
    func error(_ error: Error)
}
