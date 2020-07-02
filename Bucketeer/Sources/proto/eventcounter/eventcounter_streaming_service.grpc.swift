//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/eventcounter/streaming_service.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCall: ClientCallUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCallBase: ClientCallUnaryBase<Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCall {
  override class var method: String { return "/bucketeer.eventcounter.StreamingService/GetEvaluationRealtimeCount" }
}

internal protocol Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCall: ClientCallUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCallBase: ClientCallUnaryBase<Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCall {
  override class var method: String { return "/bucketeer.eventcounter.StreamingService/GetExperimentRealtimeCount" }
}

internal protocol Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCall: ClientCallUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCallBase: ClientCallUnaryBase<Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCall {
  override class var method: String { return "/bucketeer.eventcounter.StreamingService/GetOpsRealtimeVariationCount" }
}


/// Instantiate Bucketeer_Eventcounter_StreamingServiceServiceClient, then call methods of this protocol to make API calls.
internal protocol Bucketeer_Eventcounter_StreamingServiceService: ServiceClient {
  /// Synchronous. Unary.
  func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCall

  /// Synchronous. Unary.
  func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCall

  /// Synchronous. Unary.
  func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCall

}

internal extension Bucketeer_Eventcounter_StreamingServiceService {
  /// Synchronous. Unary.
  func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest) throws -> Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse {
    return try self.getEvaluationRealtimeCount(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, completion: @escaping (Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCall {
    return try self.getEvaluationRealtimeCount(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest) throws -> Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse {
    return try self.getExperimentRealtimeCount(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, completion: @escaping (Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCall {
    return try self.getExperimentRealtimeCount(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest) throws -> Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse {
    return try self.getOpsRealtimeVariationCount(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, completion: @escaping (Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCall {
    return try self.getOpsRealtimeVariationCount(request, metadata: self.metadata, completion: completion)
  }

}

internal final class Bucketeer_Eventcounter_StreamingServiceServiceClient: ServiceClientBase, Bucketeer_Eventcounter_StreamingServiceService {
  /// Synchronous. Unary.
  internal func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse {
    return try Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getEvaluationRealtimeCount(_ request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCall {
    return try Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse {
    return try Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getExperimentRealtimeCount(_ request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCall {
    return try Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse {
    return try Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getOpsRealtimeVariationCount(_ request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse?, CallResult) -> Void) throws -> Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCall {
    return try Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol Bucketeer_Eventcounter_StreamingServiceProvider: ServiceProvider {
  func getEvaluationRealtimeCount(request: Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, session: Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSession) throws -> Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse
  func getExperimentRealtimeCount(request: Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, session: Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSession) throws -> Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse
  func getOpsRealtimeVariationCount(request: Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, session: Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSession) throws -> Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse
}

extension Bucketeer_Eventcounter_StreamingServiceProvider {
  internal var serviceName: String { return "bucketeer.eventcounter.StreamingService" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/bucketeer.eventcounter.StreamingService/GetEvaluationRealtimeCount":
      return try Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSessionBase(
        handler: handler,
        providerBlock: { try self.getEvaluationRealtimeCount(request: $0, session: $1 as! Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSessionBase) })
          .run()
    case "/bucketeer.eventcounter.StreamingService/GetExperimentRealtimeCount":
      return try Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSessionBase(
        handler: handler,
        providerBlock: { try self.getExperimentRealtimeCount(request: $0, session: $1 as! Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSessionBase) })
          .run()
    case "/bucketeer.eventcounter.StreamingService/GetOpsRealtimeVariationCount":
      return try Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSessionBase(
        handler: handler,
        providerBlock: { try self.getOpsRealtimeVariationCount(request: $0, session: $1 as! Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSessionBase: ServerSessionUnaryBase<Bucketeer_Eventcounter_GetEvaluationRealtimeCountRequest, Bucketeer_Eventcounter_GetEvaluationRealtimeCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetEvaluationRealtimeCountSession {}

internal protocol Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSessionBase: ServerSessionUnaryBase<Bucketeer_Eventcounter_GetExperimentRealtimeCountRequest, Bucketeer_Eventcounter_GetExperimentRealtimeCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetExperimentRealtimeCountSession {}

internal protocol Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSessionBase: ServerSessionUnaryBase<Bucketeer_Eventcounter_GetOpsRealtimeVariationCountRequest, Bucketeer_Eventcounter_GetOpsRealtimeVariationCountResponse>, Bucketeer_Eventcounter_StreamingServiceGetOpsRealtimeVariationCountSession {}

