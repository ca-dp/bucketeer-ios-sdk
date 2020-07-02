import Foundation
import SwiftGRPC
import SwiftProtobuf

class EventRegisterer {
    let apiClient: APIClientProtocol
    let eventStore: EventStore

    // TODO: it's better to remove this flag because this type of variable leads bugs
    private var isProcessing = false

    init(apiClient: APIClientProtocol, eventStore: EventStore) {
        self.apiClient = apiClient
        self.eventStore = eventStore
    }

    func registerEvents(eventEntities: [EventEntity], completion: ((Result<CallResult?, BucketeerError>) -> Void)? = nil) {
        guard !isProcessing else {
            Logger.shared.debugLog("Skipped because another one is running")
            completion?(.success(nil))
            return
        }
        guard !eventEntities.isEmpty else {
            Logger.shared.debugLog("Skipped because of no events")
            completion?(.success(nil))
            return
        }
        isProcessing = true
        _registerEvents(eventEntities: eventEntities) { [weak self] result in
            self?.isProcessing = false
            switch result {
            case .success:
                Logger.shared.debugLog("Succeeded to register events")
            case .failure(let error):
                Logger.shared.errorLog("Failed to register events: \(error.localizedDescription)")
            }
            completion?(result)
        }
    }

    private func _registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<CallResult?, BucketeerError>) -> Void) {
        Logger.shared.debugLog("Run registerEvents: count: \(eventEntities.count)")
        apiClient.registerEvents(eventEntities: eventEntities) { [eventStore] result in
            switch result {
            case .success(let response, let callResult):
                guard let response = response, !callResult.isFailed else {
                    let message = "(\(Version.number)) Failed to register events: callResult: \(callResult)"
                    Logger.shared.errorLog(message)
                    completion(.failure(.unknown(message)))
                    return
                }
                // Delete events after registerEvents done.
                // - succeeded items
                // - failed items which aren't retriable
                let retriableIDs = response.errors.filter { $0.value.retriable }.map { $0.key }
                let removalIDs = eventEntities.map { $0.id }.filter { !retriableIDs.contains($0) }
                let removalItems = eventEntities.filter { removalIDs.contains($0.id) }
                eventStore.delete(removalItems) {
                    completion(.success(callResult))
                }
            case .failure(let error):
                Logger.shared.errorLog(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
