import Foundation

class Poller {
    private var timer: DispatchSourceTimer?

    private let interval: TimeInterval
    private let label: String
    private let handler: (() -> Void)

    init(interval: TimeInterval, label: String, handler: @escaping () -> Void) {
        self.interval = interval
        self.label = label
        self.handler = handler
    }

    func start() {
        if timer != nil {
            return
        }
        let queue = DispatchQueue(label: label)
        timer = DispatchSource.makeTimerSource(queue: queue)
        // memo: deadline is based on nanoseconds
        timer?.schedule(deadline: .now() + (interval / 1000), repeating: .milliseconds(Int(interval)))
        timer?.setEventHandler(handler: handler)
        timer?.resume()
    }

    func stop() {
        if timer == nil {
            return
        }
        timer?.cancel()
        timer = nil
    }
}
