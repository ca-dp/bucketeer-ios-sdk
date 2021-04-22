import Foundation

class Poller {
    private var timer: DispatchSourceTimer?
    private let interval: TimeInterval
    private let queue: DispatchQueue
    private let handler: (() -> Void)

    init(interval: TimeInterval, queue: DispatchQueue, handler: @escaping () -> Void) {
        self.interval = interval
        self.handler = handler
        self.queue = queue
    }

    func start() {
        if timer != nil {
            return
        }
        timer = DispatchSource.makeTimerSource(queue: self.queue)
        // memo: deadline is based on nanoseconds
        timer?.schedule(deadline: .now() + (interval / 1000), repeating: .milliseconds(Int(interval)))
        timer?.setEventHandler(handler: handler)
        timer?.resume()
    }

    func stop() {
        timer?.cancel()
        timer = nil
    }
}
