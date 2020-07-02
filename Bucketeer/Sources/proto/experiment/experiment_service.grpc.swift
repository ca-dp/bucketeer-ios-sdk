//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/experiment/service.proto
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

internal protocol Bucketeer_Experiment_ExperimentServiceGetGoalCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceGetGoalCallBase: ClientCallUnaryBase<Bucketeer_Experiment_GetGoalRequest, Bucketeer_Experiment_GetGoalResponse>, Bucketeer_Experiment_ExperimentServiceGetGoalCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/GetGoal" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceListGoalsCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceListGoalsCallBase: ClientCallUnaryBase<Bucketeer_Experiment_ListGoalsRequest, Bucketeer_Experiment_ListGoalsResponse>, Bucketeer_Experiment_ExperimentServiceListGoalsCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/ListGoals" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceCreateGoalCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceCreateGoalCallBase: ClientCallUnaryBase<Bucketeer_Experiment_CreateGoalRequest, Bucketeer_Experiment_CreateGoalResponse>, Bucketeer_Experiment_ExperimentServiceCreateGoalCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/CreateGoal" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceUpdateGoalCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceUpdateGoalCallBase: ClientCallUnaryBase<Bucketeer_Experiment_UpdateGoalRequest, Bucketeer_Experiment_UpdateGoalResponse>, Bucketeer_Experiment_ExperimentServiceUpdateGoalCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/UpdateGoal" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceDeleteGoalCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceDeleteGoalCallBase: ClientCallUnaryBase<Bucketeer_Experiment_DeleteGoalRequest, Bucketeer_Experiment_DeleteGoalResponse>, Bucketeer_Experiment_ExperimentServiceDeleteGoalCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/DeleteGoal" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceGetExperimentCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceGetExperimentCallBase: ClientCallUnaryBase<Bucketeer_Experiment_GetExperimentRequest, Bucketeer_Experiment_GetExperimentResponse>, Bucketeer_Experiment_ExperimentServiceGetExperimentCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/GetExperiment" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceListExperimentsCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceListExperimentsCallBase: ClientCallUnaryBase<Bucketeer_Experiment_ListExperimentsRequest, Bucketeer_Experiment_ListExperimentsResponse>, Bucketeer_Experiment_ExperimentServiceListExperimentsCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/ListExperiments" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceCreateExperimentCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceCreateExperimentCallBase: ClientCallUnaryBase<Bucketeer_Experiment_CreateExperimentRequest, Bucketeer_Experiment_CreateExperimentResponse>, Bucketeer_Experiment_ExperimentServiceCreateExperimentCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/CreateExperiment" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceUpdateExperimentCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceUpdateExperimentCallBase: ClientCallUnaryBase<Bucketeer_Experiment_UpdateExperimentRequest, Bucketeer_Experiment_UpdateExperimentResponse>, Bucketeer_Experiment_ExperimentServiceUpdateExperimentCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/UpdateExperiment" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceStopExperimentCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceStopExperimentCallBase: ClientCallUnaryBase<Bucketeer_Experiment_StopExperimentRequest, Bucketeer_Experiment_StopExperimentResponse>, Bucketeer_Experiment_ExperimentServiceStopExperimentCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/StopExperiment" }
}

internal protocol Bucketeer_Experiment_ExperimentServiceDeleteExperimentCall: ClientCallUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceDeleteExperimentCallBase: ClientCallUnaryBase<Bucketeer_Experiment_DeleteExperimentRequest, Bucketeer_Experiment_DeleteExperimentResponse>, Bucketeer_Experiment_ExperimentServiceDeleteExperimentCall {
  override class var method: String { return "/bucketeer.experiment.ExperimentService/DeleteExperiment" }
}


/// Instantiate Bucketeer_Experiment_ExperimentServiceServiceClient, then call methods of this protocol to make API calls.
internal protocol Bucketeer_Experiment_ExperimentServiceService: ServiceClient {
  /// Synchronous. Unary.
  func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_GetGoalResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_GetGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetGoalCall

  /// Synchronous. Unary.
  func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_ListGoalsResponse
  /// Asynchronous. Unary.
  @discardableResult
  func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_ListGoalsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListGoalsCall

  /// Synchronous. Unary.
  func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_CreateGoalResponse
  /// Asynchronous. Unary.
  @discardableResult
  func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_CreateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateGoalCall

  /// Synchronous. Unary.
  func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_UpdateGoalResponse
  /// Asynchronous. Unary.
  @discardableResult
  func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_UpdateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateGoalCall

  /// Synchronous. Unary.
  func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_DeleteGoalResponse
  /// Asynchronous. Unary.
  @discardableResult
  func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_DeleteGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteGoalCall

  /// Synchronous. Unary.
  func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_GetExperimentResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_GetExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetExperimentCall

  /// Synchronous. Unary.
  func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_ListExperimentsResponse
  /// Asynchronous. Unary.
  @discardableResult
  func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_ListExperimentsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListExperimentsCall

  /// Synchronous. Unary.
  func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_CreateExperimentResponse
  /// Asynchronous. Unary.
  @discardableResult
  func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_CreateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateExperimentCall

  /// Synchronous. Unary.
  func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_UpdateExperimentResponse
  /// Asynchronous. Unary.
  @discardableResult
  func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_UpdateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateExperimentCall

  /// Synchronous. Unary.
  func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_StopExperimentResponse
  /// Asynchronous. Unary.
  @discardableResult
  func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_StopExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceStopExperimentCall

  /// Synchronous. Unary.
  func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_DeleteExperimentResponse
  /// Asynchronous. Unary.
  @discardableResult
  func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_DeleteExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteExperimentCall

}

internal extension Bucketeer_Experiment_ExperimentServiceService {
  /// Synchronous. Unary.
  func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest) throws -> Bucketeer_Experiment_GetGoalResponse {
    return try self.getGoal(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest, completion: @escaping (Bucketeer_Experiment_GetGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetGoalCall {
    return try self.getGoal(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest) throws -> Bucketeer_Experiment_ListGoalsResponse {
    return try self.listGoals(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest, completion: @escaping (Bucketeer_Experiment_ListGoalsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListGoalsCall {
    return try self.listGoals(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest) throws -> Bucketeer_Experiment_CreateGoalResponse {
    return try self.createGoal(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest, completion: @escaping (Bucketeer_Experiment_CreateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateGoalCall {
    return try self.createGoal(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest) throws -> Bucketeer_Experiment_UpdateGoalResponse {
    return try self.updateGoal(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest, completion: @escaping (Bucketeer_Experiment_UpdateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateGoalCall {
    return try self.updateGoal(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest) throws -> Bucketeer_Experiment_DeleteGoalResponse {
    return try self.deleteGoal(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest, completion: @escaping (Bucketeer_Experiment_DeleteGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteGoalCall {
    return try self.deleteGoal(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest) throws -> Bucketeer_Experiment_GetExperimentResponse {
    return try self.getExperiment(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest, completion: @escaping (Bucketeer_Experiment_GetExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetExperimentCall {
    return try self.getExperiment(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest) throws -> Bucketeer_Experiment_ListExperimentsResponse {
    return try self.listExperiments(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest, completion: @escaping (Bucketeer_Experiment_ListExperimentsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListExperimentsCall {
    return try self.listExperiments(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest) throws -> Bucketeer_Experiment_CreateExperimentResponse {
    return try self.createExperiment(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest, completion: @escaping (Bucketeer_Experiment_CreateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateExperimentCall {
    return try self.createExperiment(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest) throws -> Bucketeer_Experiment_UpdateExperimentResponse {
    return try self.updateExperiment(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest, completion: @escaping (Bucketeer_Experiment_UpdateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateExperimentCall {
    return try self.updateExperiment(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest) throws -> Bucketeer_Experiment_StopExperimentResponse {
    return try self.stopExperiment(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest, completion: @escaping (Bucketeer_Experiment_StopExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceStopExperimentCall {
    return try self.stopExperiment(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest) throws -> Bucketeer_Experiment_DeleteExperimentResponse {
    return try self.deleteExperiment(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest, completion: @escaping (Bucketeer_Experiment_DeleteExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteExperimentCall {
    return try self.deleteExperiment(request, metadata: self.metadata, completion: completion)
  }

}

internal final class Bucketeer_Experiment_ExperimentServiceServiceClient: ServiceClientBase, Bucketeer_Experiment_ExperimentServiceService {
  /// Synchronous. Unary.
  internal func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_GetGoalResponse {
    return try Bucketeer_Experiment_ExperimentServiceGetGoalCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getGoal(_ request: Bucketeer_Experiment_GetGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_GetGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetGoalCall {
    return try Bucketeer_Experiment_ExperimentServiceGetGoalCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_ListGoalsResponse {
    return try Bucketeer_Experiment_ExperimentServiceListGoalsCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func listGoals(_ request: Bucketeer_Experiment_ListGoalsRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_ListGoalsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListGoalsCall {
    return try Bucketeer_Experiment_ExperimentServiceListGoalsCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_CreateGoalResponse {
    return try Bucketeer_Experiment_ExperimentServiceCreateGoalCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func createGoal(_ request: Bucketeer_Experiment_CreateGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_CreateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateGoalCall {
    return try Bucketeer_Experiment_ExperimentServiceCreateGoalCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_UpdateGoalResponse {
    return try Bucketeer_Experiment_ExperimentServiceUpdateGoalCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func updateGoal(_ request: Bucketeer_Experiment_UpdateGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_UpdateGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateGoalCall {
    return try Bucketeer_Experiment_ExperimentServiceUpdateGoalCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_DeleteGoalResponse {
    return try Bucketeer_Experiment_ExperimentServiceDeleteGoalCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func deleteGoal(_ request: Bucketeer_Experiment_DeleteGoalRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_DeleteGoalResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteGoalCall {
    return try Bucketeer_Experiment_ExperimentServiceDeleteGoalCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_GetExperimentResponse {
    return try Bucketeer_Experiment_ExperimentServiceGetExperimentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getExperiment(_ request: Bucketeer_Experiment_GetExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_GetExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceGetExperimentCall {
    return try Bucketeer_Experiment_ExperimentServiceGetExperimentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_ListExperimentsResponse {
    return try Bucketeer_Experiment_ExperimentServiceListExperimentsCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func listExperiments(_ request: Bucketeer_Experiment_ListExperimentsRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_ListExperimentsResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceListExperimentsCall {
    return try Bucketeer_Experiment_ExperimentServiceListExperimentsCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_CreateExperimentResponse {
    return try Bucketeer_Experiment_ExperimentServiceCreateExperimentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func createExperiment(_ request: Bucketeer_Experiment_CreateExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_CreateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceCreateExperimentCall {
    return try Bucketeer_Experiment_ExperimentServiceCreateExperimentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_UpdateExperimentResponse {
    return try Bucketeer_Experiment_ExperimentServiceUpdateExperimentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func updateExperiment(_ request: Bucketeer_Experiment_UpdateExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_UpdateExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceUpdateExperimentCall {
    return try Bucketeer_Experiment_ExperimentServiceUpdateExperimentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_StopExperimentResponse {
    return try Bucketeer_Experiment_ExperimentServiceStopExperimentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func stopExperiment(_ request: Bucketeer_Experiment_StopExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_StopExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceStopExperimentCall {
    return try Bucketeer_Experiment_ExperimentServiceStopExperimentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest, metadata customMetadata: Metadata) throws -> Bucketeer_Experiment_DeleteExperimentResponse {
    return try Bucketeer_Experiment_ExperimentServiceDeleteExperimentCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func deleteExperiment(_ request: Bucketeer_Experiment_DeleteExperimentRequest, metadata customMetadata: Metadata, completion: @escaping (Bucketeer_Experiment_DeleteExperimentResponse?, CallResult) -> Void) throws -> Bucketeer_Experiment_ExperimentServiceDeleteExperimentCall {
    return try Bucketeer_Experiment_ExperimentServiceDeleteExperimentCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol Bucketeer_Experiment_ExperimentServiceProvider: ServiceProvider {
  func getGoal(request: Bucketeer_Experiment_GetGoalRequest, session: Bucketeer_Experiment_ExperimentServiceGetGoalSession) throws -> Bucketeer_Experiment_GetGoalResponse
  func listGoals(request: Bucketeer_Experiment_ListGoalsRequest, session: Bucketeer_Experiment_ExperimentServiceListGoalsSession) throws -> Bucketeer_Experiment_ListGoalsResponse
  func createGoal(request: Bucketeer_Experiment_CreateGoalRequest, session: Bucketeer_Experiment_ExperimentServiceCreateGoalSession) throws -> Bucketeer_Experiment_CreateGoalResponse
  func updateGoal(request: Bucketeer_Experiment_UpdateGoalRequest, session: Bucketeer_Experiment_ExperimentServiceUpdateGoalSession) throws -> Bucketeer_Experiment_UpdateGoalResponse
  func deleteGoal(request: Bucketeer_Experiment_DeleteGoalRequest, session: Bucketeer_Experiment_ExperimentServiceDeleteGoalSession) throws -> Bucketeer_Experiment_DeleteGoalResponse
  func getExperiment(request: Bucketeer_Experiment_GetExperimentRequest, session: Bucketeer_Experiment_ExperimentServiceGetExperimentSession) throws -> Bucketeer_Experiment_GetExperimentResponse
  func listExperiments(request: Bucketeer_Experiment_ListExperimentsRequest, session: Bucketeer_Experiment_ExperimentServiceListExperimentsSession) throws -> Bucketeer_Experiment_ListExperimentsResponse
  func createExperiment(request: Bucketeer_Experiment_CreateExperimentRequest, session: Bucketeer_Experiment_ExperimentServiceCreateExperimentSession) throws -> Bucketeer_Experiment_CreateExperimentResponse
  func updateExperiment(request: Bucketeer_Experiment_UpdateExperimentRequest, session: Bucketeer_Experiment_ExperimentServiceUpdateExperimentSession) throws -> Bucketeer_Experiment_UpdateExperimentResponse
  func stopExperiment(request: Bucketeer_Experiment_StopExperimentRequest, session: Bucketeer_Experiment_ExperimentServiceStopExperimentSession) throws -> Bucketeer_Experiment_StopExperimentResponse
  func deleteExperiment(request: Bucketeer_Experiment_DeleteExperimentRequest, session: Bucketeer_Experiment_ExperimentServiceDeleteExperimentSession) throws -> Bucketeer_Experiment_DeleteExperimentResponse
}

extension Bucketeer_Experiment_ExperimentServiceProvider {
  internal var serviceName: String { return "bucketeer.experiment.ExperimentService" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/bucketeer.experiment.ExperimentService/GetGoal":
      return try Bucketeer_Experiment_ExperimentServiceGetGoalSessionBase(
        handler: handler,
        providerBlock: { try self.getGoal(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceGetGoalSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/ListGoals":
      return try Bucketeer_Experiment_ExperimentServiceListGoalsSessionBase(
        handler: handler,
        providerBlock: { try self.listGoals(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceListGoalsSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/CreateGoal":
      return try Bucketeer_Experiment_ExperimentServiceCreateGoalSessionBase(
        handler: handler,
        providerBlock: { try self.createGoal(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceCreateGoalSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/UpdateGoal":
      return try Bucketeer_Experiment_ExperimentServiceUpdateGoalSessionBase(
        handler: handler,
        providerBlock: { try self.updateGoal(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceUpdateGoalSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/DeleteGoal":
      return try Bucketeer_Experiment_ExperimentServiceDeleteGoalSessionBase(
        handler: handler,
        providerBlock: { try self.deleteGoal(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceDeleteGoalSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/GetExperiment":
      return try Bucketeer_Experiment_ExperimentServiceGetExperimentSessionBase(
        handler: handler,
        providerBlock: { try self.getExperiment(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceGetExperimentSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/ListExperiments":
      return try Bucketeer_Experiment_ExperimentServiceListExperimentsSessionBase(
        handler: handler,
        providerBlock: { try self.listExperiments(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceListExperimentsSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/CreateExperiment":
      return try Bucketeer_Experiment_ExperimentServiceCreateExperimentSessionBase(
        handler: handler,
        providerBlock: { try self.createExperiment(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceCreateExperimentSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/UpdateExperiment":
      return try Bucketeer_Experiment_ExperimentServiceUpdateExperimentSessionBase(
        handler: handler,
        providerBlock: { try self.updateExperiment(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceUpdateExperimentSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/StopExperiment":
      return try Bucketeer_Experiment_ExperimentServiceStopExperimentSessionBase(
        handler: handler,
        providerBlock: { try self.stopExperiment(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceStopExperimentSessionBase) })
          .run()
    case "/bucketeer.experiment.ExperimentService/DeleteExperiment":
      return try Bucketeer_Experiment_ExperimentServiceDeleteExperimentSessionBase(
        handler: handler,
        providerBlock: { try self.deleteExperiment(request: $0, session: $1 as! Bucketeer_Experiment_ExperimentServiceDeleteExperimentSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol Bucketeer_Experiment_ExperimentServiceGetGoalSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceGetGoalSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_GetGoalRequest, Bucketeer_Experiment_GetGoalResponse>, Bucketeer_Experiment_ExperimentServiceGetGoalSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceListGoalsSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceListGoalsSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_ListGoalsRequest, Bucketeer_Experiment_ListGoalsResponse>, Bucketeer_Experiment_ExperimentServiceListGoalsSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceCreateGoalSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceCreateGoalSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_CreateGoalRequest, Bucketeer_Experiment_CreateGoalResponse>, Bucketeer_Experiment_ExperimentServiceCreateGoalSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceUpdateGoalSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceUpdateGoalSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_UpdateGoalRequest, Bucketeer_Experiment_UpdateGoalResponse>, Bucketeer_Experiment_ExperimentServiceUpdateGoalSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceDeleteGoalSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceDeleteGoalSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_DeleteGoalRequest, Bucketeer_Experiment_DeleteGoalResponse>, Bucketeer_Experiment_ExperimentServiceDeleteGoalSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceGetExperimentSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceGetExperimentSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_GetExperimentRequest, Bucketeer_Experiment_GetExperimentResponse>, Bucketeer_Experiment_ExperimentServiceGetExperimentSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceListExperimentsSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceListExperimentsSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_ListExperimentsRequest, Bucketeer_Experiment_ListExperimentsResponse>, Bucketeer_Experiment_ExperimentServiceListExperimentsSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceCreateExperimentSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceCreateExperimentSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_CreateExperimentRequest, Bucketeer_Experiment_CreateExperimentResponse>, Bucketeer_Experiment_ExperimentServiceCreateExperimentSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceUpdateExperimentSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceUpdateExperimentSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_UpdateExperimentRequest, Bucketeer_Experiment_UpdateExperimentResponse>, Bucketeer_Experiment_ExperimentServiceUpdateExperimentSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceStopExperimentSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceStopExperimentSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_StopExperimentRequest, Bucketeer_Experiment_StopExperimentResponse>, Bucketeer_Experiment_ExperimentServiceStopExperimentSession {}

internal protocol Bucketeer_Experiment_ExperimentServiceDeleteExperimentSession: ServerSessionUnary {}

fileprivate final class Bucketeer_Experiment_ExperimentServiceDeleteExperimentSessionBase: ServerSessionUnaryBase<Bucketeer_Experiment_DeleteExperimentRequest, Bucketeer_Experiment_DeleteExperimentResponse>, Bucketeer_Experiment_ExperimentServiceDeleteExperimentSession {}

