import Foundation

public enum LogLevel: Int {
    case none
    case error
    case debug
}

class Logger {
    private static let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return f
    }()

    public static let shared = Logger()

    private(set) var logLevel: LogLevel = .error
    private(set) var prefix: String = ""

    private init() {}

    func setLogLevel(_ logLevel: LogLevel) {
        self.logLevel = logLevel
    }

    func setPrefix(_ prefix: String) {
        self.prefix = prefix
    }

    func errorLog(_ message: String = "", function: StaticString = #function, file: StaticString = #file, line: UInt = #line) {
        printLog(logLevel: LogLevel.error, message, function: function, file: file, line: line)
    }

    func debugLog(_ message: String = "", function: StaticString = #function, file: StaticString = #file, line: UInt = #line) {
        printLog(logLevel: LogLevel.debug, message, function: function, file: file, line: line)
    }

    private func printLog(logLevel: LogLevel, _ message: String = "", function: StaticString = #function, file: StaticString = #file, line: UInt = #line) {
        guard self.logLevel != .none,
            self.logLevel.rawValue >= logLevel.rawValue else {
                return
        }
        let fileParam: String
        if let fileName = URL(string: "\(file)")?.lastPathComponent {
            fileParam = fileName
        } else {
            fileParam = "\(file)"
        }
        NSLog("\(prefix) \(Logger.dateFormatter.string(from: Date())), \(message), function: \(function), file: \(fileParam) L:\(line)")
    }
}
