import Foundation
import GRPC
import NIO
import NIOHPACK
import SwiftProtobuf

protocol APIClientProtocol {
    func getEvaluations(userEntity: UserEntity, userEvaluationsId: String, completion: @escaping (Result<(Bucketeer_Gateway_GetEvaluationsResponse?, CallResult), BucketeerError>) -> Void)
    
    func registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<(Bucketeer_Gateway_RegisterEventsResponse?, CallResult), BucketeerError>) -> Void)
}

final class APIClient: APIClientProtocol {
    private let config: Config
    private let serviceClient: Bucketeer_Gateway_GatewayClient
    
    init(config: Config) {
        self.config = config
        let builder = ClientConnection.secure(group: PlatformSupport.makeEventLoopGroup(loopCount: config.eventLoopCount))
        let connection = builder.connect(host: config.apiURL, port: config.port)
        let metadata: HPACKHeaders = ["authorization": config.sdkKey]
        let timeLimit = TimeLimit.timeout(TimeAmount.seconds(config.requestTimeout))
        let callOpts = CallOptions(customMetadata: metadata, timeLimit: timeLimit)
        serviceClient = Bucketeer_Gateway_GatewayClient(channel: connection, defaultCallOptions: callOpts)
    }

    func getEvaluations(userEntity: UserEntity, userEvaluationsId: String, completion: @escaping (Result<(Bucketeer_Gateway_GetEvaluationsResponse?, CallResult), BucketeerError>) -> Void) {
        var request = Bucketeer_Gateway_GetEvaluationsRequest()
        request.user = userEntity.user
        request.sourceID = Bucketeer_Event_Client_SourceId.ios
        request.tag = self.config.tag
        request.userEvaluationsID = userEvaluationsId
        let call = self.serviceClient.getEvaluations(request)
        let response: Bucketeer_Gateway_GetEvaluationsResponse
        let status: GRPCStatus
        let errorHandler: (String) -> Void = { message in
            Logger.shared.errorLog(message)
            completion(.failure(.unknown(message)))
        }
        do {
            let result = try call.response.and(call.status).wait()
            response = result.0
            status = result.1
        } catch {
            errorHandler("(\(Version.number)) Failed to get evaluations: \(error.localizedDescription)")
            return
        }
        let callResult = CallResult(success: status.isOk, code: status.code, message: status.message)
        if callResult.isFailed {
            errorHandler("(\(Version.number)) Failed to get evaluations: \(callResult)")
            return
        }
        completion(.success((response, callResult)))
    }
    
    func registerEvents(eventEntities: [EventEntity], completion: @escaping (Result<(Bucketeer_Gateway_RegisterEventsResponse?, CallResult), BucketeerError>) -> Void) {
        var request = Bucketeer_Gateway_RegisterEventsRequest()
        request.events = eventEntities.compactMap { try? Bucketeer_Event_Client_Event(serializedData: $0.data) }
        let call = self.serviceClient.registerEvents(request)
        let response: Bucketeer_Gateway_RegisterEventsResponse
        let status: GRPCStatus
        let errorHandler: (String) -> Void = { message in
            Logger.shared.errorLog(message)
            completion(.failure(.unknown(message)))
        }
        do {
            let result = try call.response.and(call.status).wait()
            response = result.0
            status = result.1
        } catch {
            errorHandler("(\(Version.number)) Failed to register events: \(error.localizedDescription)")
            return
        }
        let callResult = CallResult(success: status.isOk, code: status.code, message: status.message)
        if callResult.isFailed {
            errorHandler("(\(Version.number)) Failed to get evaluations: \(callResult)")
            return
        }
        completion(.success((response, callResult)))
    }
}
