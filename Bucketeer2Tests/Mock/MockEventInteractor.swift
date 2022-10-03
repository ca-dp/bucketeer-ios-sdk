import Foundation
@testable import Bucketeer2

final class MockEventInteractor: EventInteractor {
    typealias SendEventsHandler = (_ force: Bool, _ completion: ((Result<Bool, Error>) -> Void)?) -> Void
    typealias TrackEvaluationSuccessHandler = (_ featureTag: String, _ seconds: Int64, _ sizeByte: Int) throws -> Void
    typealias TrackEvaluationFailureHandler = (_ featureTag: String, _ error: BKTError) throws -> Void

    var eventUpdateListener: EventUpdateListener?
    var sendEventsHandler: SendEventsHandler?
    var trackEvaluationSuccessHandler: TrackEvaluationSuccessHandler?
    var trackEvaluationFailureHandler: TrackEvaluationFailureHandler?

    init(eventUpdateListener: EventUpdateListener? = nil,
         sendEventsHandler: SendEventsHandler? = nil,
         trackEvaluationSuccessHandler: TrackEvaluationSuccessHandler? = nil,
         trackEvaluationFailureHandler: TrackEvaluationFailureHandler? = nil) {
        self.eventUpdateListener = eventUpdateListener
        self.sendEventsHandler = sendEventsHandler
        self.trackEvaluationSuccessHandler = trackEvaluationSuccessHandler
        self.trackEvaluationFailureHandler = trackEvaluationFailureHandler
    }

    func set(eventUpdateListener: EventUpdateListener?) {
        self.eventUpdateListener = eventUpdateListener
    }
    func trackFetchEvaluationsSuccess(featureTag: String, seconds: Int64, sizeByte: Int) throws {
        try trackEvaluationSuccessHandler?(featureTag, seconds, sizeByte)
    }
    func trackFetchEvaluationsFailure(featureTag: String, error: BKTError) throws {
        try trackEvaluationFailureHandler?(featureTag, error)
    }
    func sendEvents(force: Bool, completion: ((Result<Bool, Error>) -> Void)?) {
        sendEventsHandler?(force, completion)
    }
}
