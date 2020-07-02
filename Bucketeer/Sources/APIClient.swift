import Foundation
import SwiftGRPC
import SwiftProtobuf

protocol APIClientProtocol {
    func getEvaluations(userEntity: UserEntity, userEvaluationsId: String, completion: @escaping (Result<(Bucketeer_Gateway_GetEvaluationsResponse?, CallResult), BucketeerError>) -> Void)
    
    func registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<(Bucketeer_Gateway_RegisterEventsResponse?, CallResult), BucketeerError>) -> Void)
}

final class APIClient: APIClientProtocol {
    private let config: Config
    private let serviceClient: Bucketeer_Gateway_GatewayServiceClient
    private let queue = DispatchQueue(label: "jp.co.cyberagent.bucketeer.APIQueue", attributes: .concurrent)

    init(config: Config) {
        self.config = config
        if let certificate = config.certificate {
            serviceClient = Bucketeer_Gateway_GatewayServiceClient(address: config.apiURL, certificates: certificate)
        } else {
            serviceClient = Bucketeer_Gateway_GatewayServiceClient(address: config.apiURL, secure: true)
        }
        do {
            serviceClient.metadata = try Metadata(["authorization": config.sdkKey])
        } catch Metadata.Error.doesNotOwnFields {
            let message = "(\(Version.number)) Failed to initialize the metadata: \(Metadata.Error.doesNotOwnFields.localizedDescription)"
            Logger.shared.errorLog(message)
        } catch {
            let message = "(\(Version.number)) Failed to initialize the metadata: \(error.localizedDescription)"
            Logger.shared.errorLog(message)
        }
        serviceClient.timeout = config.requestTimeout
    }

    func getEvaluations(userEntity: UserEntity, userEvaluationsId: String, completion: @escaping (Result<(Bucketeer_Gateway_GetEvaluationsResponse?, CallResult), BucketeerError>) -> Void) {
        queue.async {
            var request = Bucketeer_Gateway_GetEvaluationsRequest()
            request.user = userEntity.user
            request.tag = self.config.tag
            request.userEvaluationsID = userEvaluationsId
            do {
                _ = try self.serviceClient.getEvaluations(request) { response, callResult in
                    if callResult.isFailed {
                        let message = "(\(Version.number)) Failed to get evaluations: \(callResult)"
                        Logger.shared.errorLog(message)
                        completion(.failure(.unknown(message)))
                        return
                    }
                    completion(.success((response, callResult)))
                }
            } catch {
                let message = "(\(Version.number)) Failed to get evaluations: \(error.localizedDescription)"
                Logger.shared.errorLog(message)
                completion(.failure(.unknown(message)))
            }
        }
    }

    func registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<(Bucketeer_Gateway_RegisterEventsResponse?, CallResult), BucketeerError>) -> Void) {
        queue.async {
            var request = Bucketeer_Gateway_RegisterEventsRequest()
            request.events = eventEntities.compactMap { try? Bucketeer_Event_Client_Event(serializedData: $0.data) }
            do {
                _ = try self.serviceClient.registerEvents(request) { response, callResult in
                    if callResult.isFailed {
                        let messsage = "(\(Version.number)) Failed to register events: \(callResult)"
                        Logger.shared.errorLog(messsage)
                        completion(.failure(.unknown(messsage)))
                        return
                    }
                    completion(.success((response, callResult)))
                }
            } catch {
                let message = "(\(Version.number)) Failed to register events: \(error.localizedDescription)"
                Logger.shared.errorLog(message)
                completion(.failure(.unknown(message)))
            }
        }
    }
}
