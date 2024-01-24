//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/user/service.proto
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
import GRPC
import NIO
import SwiftProtobuf


/// Usage: instantiate Bucketeer_User_UserServiceClient, then call methods of this protocol to make API calls.
internal protocol Bucketeer_User_UserServiceClientProtocol: GRPCClient {
  func getUser(
    _ request: Bucketeer_User_GetUserRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_User_GetUserRequest, Bucketeer_User_GetUserResponse>

  func listUsers(
    _ request: Bucketeer_User_ListUsersRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_User_ListUsersRequest, Bucketeer_User_ListUsersResponse>

}

extension Bucketeer_User_UserServiceClientProtocol {

  /// Unary call to GetUser
  ///
  /// - Parameters:
  ///   - request: Request to send to GetUser.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getUser(
    _ request: Bucketeer_User_GetUserRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_User_GetUserRequest, Bucketeer_User_GetUserResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.user.UserService/GetUser",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to ListUsers
  ///
  /// - Parameters:
  ///   - request: Request to send to ListUsers.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func listUsers(
    _ request: Bucketeer_User_ListUsersRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_User_ListUsersRequest, Bucketeer_User_ListUsersResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.user.UserService/ListUsers",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Bucketeer_User_UserServiceClient: Bucketeer_User_UserServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the bucketeer.user.UserService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  internal init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }
}
