import Foundation
import GRPC
import SwiftProtobuf

struct EventSaver {
    let eventStore: EventStore
    let tag: String
    
    func saveEvaluationEvent(
        userEntity: UserEntity,
        evaluationEntity: EvaluationEntity,
        completion: ((Int?) -> Void)? = nil
    ) {
        let evaluationEvent = Bucketeer_Event_Client_EvaluationEvent(
            tag: tag,
            user: userEntity.user,
            timestamp: Date().timestamp,
            evaluation: evaluationEntity.evaluation
        )
        guard let eventEntity = EventEntity(eventType: .evaluation, event: evaluationEvent) else {
            completion?(nil)
            return
        }
        eventStore.save([eventEntity], completion: completion)
    }
    
    func saveClientDefaultEvaluationEvent(
        userEntity: UserEntity,
        featureID: String,
        completion: ((Int?) -> Void)? = nil
    ) {
        let evaluationEvent = Bucketeer_Event_Client_EvaluationEvent(
            tag: tag,
            user: userEntity.user,
            timestamp: Date().timestamp,
            featureID: featureID
        )
        guard let eventEntity = EventEntity(eventType: .evaluation, event: evaluationEvent) else {
            completion?(nil)
            return
        }
        eventStore.save([eventEntity], completion: completion)
    }
    
    func saveGoalEvent(
        userEntity: UserEntity,
        goalID: String,
        value: Double,
        evaluationEntities: Set<EvaluationEntity>,
        completion: ((Int?) -> Void)? = nil
    ) {
        let goalEvent = Bucketeer_Event_Client_GoalEvent(
            tag: tag,
            user: userEntity.user,
            timestamp: Date().timestamp,
            goalID: goalID,
            value: value,
            evaluationEntities: evaluationEntities
        )
        guard let eventEntity = EventEntity(eventType: .goal, event: goalEvent) else {
            completion?(nil)
            return
        }
        eventStore.save([eventEntity], completion: completion)
    }
    
    func saveGetEvaluationLatencyMetricsEvent(
        duration: TimeInterval,
        labels: Dictionary<String, String>,
        completion: ((Int?) -> Void)? = nil
    ) {
        let getEvaluationLatencyMetricsEvent = Bucketeer_Event_Client_GetEvaluationLatencyMetricsEvent(labels: labels,
                                                                                                       duration: duration)
        let metricsEvent = Bucketeer_Event_Client_MetricsEvent(timestamp: Date().timestamp,
                                                               event: getEvaluationLatencyMetricsEvent)
        guard let eventEntity = EventEntity(eventType: .metrics, event: metricsEvent) else {
            completion?(nil)
            return
        }
        eventStore.save([eventEntity], completion: completion)
    }
    
    func saveGetEvaluationSizeMetricsEvent(
        sizeByte: Int32,
        labels: Dictionary<String, String>,
        completion: ((Int?) -> Void)? = nil
    ) {
        let getEvaluationSizeMetricsEvent = Bucketeer_Event_Client_GetEvaluationSizeMetricsEvent(labels: labels,
                                                                                                 sizeByte: sizeByte)
        let metricsEvent = Bucketeer_Event_Client_MetricsEvent(timestamp: Date().timestamp,
                                                               event: getEvaluationSizeMetricsEvent)
        guard let eventEntity = EventEntity(eventType: .metrics, event: metricsEvent) else {
            completion?(nil)
            return
        }
        eventStore.save([eventEntity], completion: completion)
    }
}

private extension Bucketeer_Event_Client_EvaluationEvent {
    init(
        tag: String,
        user: Bucketeer_User_User,
        timestamp: Int64,
        evaluation: Bucketeer_Feature_Evaluation
    ) {
        self.timestamp = timestamp
        self.featureID = evaluation.featureID
        self.featureVersion = evaluation.featureVersion
        self.userID = user.id
        self.variationID = evaluation.variationID
        self.user = user
        self.reason = evaluation.reason
        self.tag = tag
        self.sourceID = Bucketeer_Event_Client_SourceId.ios
    }
    
    /// init for client event defalut value
    init(tag: String, user: Bucketeer_User_User, timestamp: Int64, featureID: String) {
        var reason = Bucketeer_Feature_Reason()
        reason.type = .client
        self.timestamp = timestamp
        self.featureID = featureID
        self.featureVersion = 0
        self.userID = user.id
        self.variationID = ""
        self.user = user
        self.reason = reason
        self.tag = tag
        self.sourceID = Bucketeer_Event_Client_SourceId.ios
    }
}

private extension Bucketeer_Event_Client_GoalEvent {
    init(
        tag: String,
        user: Bucketeer_User_User,
        timestamp: Int64,
        goalID: String,
        value: Double,
        evaluationEntities: Set<EvaluationEntity>
    ) {
        self.timestamp = timestamp
        self.goalID = goalID
        self.userID = user.id
        self.value = value
        self.user = user
        self.evaluations = evaluationEntities.compactMap { $0.evaluation }
        self.tag = tag
        self.sourceID = Bucketeer_Event_Client_SourceId.ios
    }
}

private extension Bucketeer_Event_Client_MetricsEvent {
    init(timestamp: Int64, event: Message) {
        self.timestamp = timestamp
        do {
            self.event = try Google_Protobuf_Any(message: event)
        } catch {
            Logger.shared.errorLog("\(error.localizedDescription)\n event: \(event)")
        }
    }
}

private extension Bucketeer_Event_Client_GetEvaluationLatencyMetricsEvent {
    init(labels: Dictionary<String,String>, duration: TimeInterval) {
        self.labels = labels
        self.duration = SwiftProtobuf.Google_Protobuf_Duration(timeInterval: duration)
    }
}

private extension Bucketeer_Event_Client_GetEvaluationSizeMetricsEvent {
    init(labels: Dictionary<String,String>, sizeByte: Int32) {
        self.labels = labels
        self.sizeByte = sizeByte
    }
}
