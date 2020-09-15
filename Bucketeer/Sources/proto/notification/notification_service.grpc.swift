//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: proto/notification/service.proto
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


/// Usage: instantiate Bucketeer_Notification_NotificationServiceClient, then call methods of this protocol to make API calls.
internal protocol Bucketeer_Notification_NotificationServiceClientProtocol: GRPCClient {
  func getAdminSubscription(
    _ request: Bucketeer_Notification_GetAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_GetAdminSubscriptionRequest, Bucketeer_Notification_GetAdminSubscriptionResponse>

  func listAdminSubscriptions(
    _ request: Bucketeer_Notification_ListAdminSubscriptionsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_ListAdminSubscriptionsRequest, Bucketeer_Notification_ListAdminSubscriptionsResponse>

  func createAdminSubscription(
    _ request: Bucketeer_Notification_CreateAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_CreateAdminSubscriptionRequest, Bucketeer_Notification_CreateAdminSubscriptionResponse>

  func deleteAdminSubscription(
    _ request: Bucketeer_Notification_DeleteAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_DeleteAdminSubscriptionRequest, Bucketeer_Notification_DeleteAdminSubscriptionResponse>

  func enableAdminSubscription(
    _ request: Bucketeer_Notification_EnableAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_EnableAdminSubscriptionRequest, Bucketeer_Notification_EnableAdminSubscriptionResponse>

  func disableAdminSubscription(
    _ request: Bucketeer_Notification_DisableAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_DisableAdminSubscriptionRequest, Bucketeer_Notification_DisableAdminSubscriptionResponse>

  func updateAdminSubscription(
    _ request: Bucketeer_Notification_UpdateAdminSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_UpdateAdminSubscriptionRequest, Bucketeer_Notification_UpdateAdminSubscriptionResponse>

  func getSubscription(
    _ request: Bucketeer_Notification_GetSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_GetSubscriptionRequest, Bucketeer_Notification_GetSubscriptionResponse>

  func listSubscriptions(
    _ request: Bucketeer_Notification_ListSubscriptionsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_ListSubscriptionsRequest, Bucketeer_Notification_ListSubscriptionsResponse>

  func createSubscription(
    _ request: Bucketeer_Notification_CreateSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_CreateSubscriptionRequest, Bucketeer_Notification_CreateSubscriptionResponse>

  func deleteSubscription(
    _ request: Bucketeer_Notification_DeleteSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_DeleteSubscriptionRequest, Bucketeer_Notification_DeleteSubscriptionResponse>

  func enableSubscription(
    _ request: Bucketeer_Notification_EnableSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_EnableSubscriptionRequest, Bucketeer_Notification_EnableSubscriptionResponse>

  func disableSubscription(
    _ request: Bucketeer_Notification_DisableSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_DisableSubscriptionRequest, Bucketeer_Notification_DisableSubscriptionResponse>

  func updateSubscription(
    _ request: Bucketeer_Notification_UpdateSubscriptionRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Bucketeer_Notification_UpdateSubscriptionRequest, Bucketeer_Notification_UpdateSubscriptionResponse>

}

extension Bucketeer_Notification_NotificationServiceClientProtocol {

  /// Unary call to GetAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to GetAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getAdminSubscription(
    _ request: Bucketeer_Notification_GetAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_GetAdminSubscriptionRequest, Bucketeer_Notification_GetAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/GetAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to ListAdminSubscriptions
  ///
  /// - Parameters:
  ///   - request: Request to send to ListAdminSubscriptions.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func listAdminSubscriptions(
    _ request: Bucketeer_Notification_ListAdminSubscriptionsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_ListAdminSubscriptionsRequest, Bucketeer_Notification_ListAdminSubscriptionsResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/ListAdminSubscriptions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to CreateAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createAdminSubscription(
    _ request: Bucketeer_Notification_CreateAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_CreateAdminSubscriptionRequest, Bucketeer_Notification_CreateAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/CreateAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to DeleteAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteAdminSubscription(
    _ request: Bucketeer_Notification_DeleteAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_DeleteAdminSubscriptionRequest, Bucketeer_Notification_DeleteAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/DeleteAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to EnableAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to EnableAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func enableAdminSubscription(
    _ request: Bucketeer_Notification_EnableAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_EnableAdminSubscriptionRequest, Bucketeer_Notification_EnableAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/EnableAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to DisableAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to DisableAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func disableAdminSubscription(
    _ request: Bucketeer_Notification_DisableAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_DisableAdminSubscriptionRequest, Bucketeer_Notification_DisableAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/DisableAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to UpdateAdminSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateAdminSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateAdminSubscription(
    _ request: Bucketeer_Notification_UpdateAdminSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_UpdateAdminSubscriptionRequest, Bucketeer_Notification_UpdateAdminSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/UpdateAdminSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to GetSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to GetSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getSubscription(
    _ request: Bucketeer_Notification_GetSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_GetSubscriptionRequest, Bucketeer_Notification_GetSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/GetSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to ListSubscriptions
  ///
  /// - Parameters:
  ///   - request: Request to send to ListSubscriptions.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func listSubscriptions(
    _ request: Bucketeer_Notification_ListSubscriptionsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_ListSubscriptionsRequest, Bucketeer_Notification_ListSubscriptionsResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/ListSubscriptions",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to CreateSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createSubscription(
    _ request: Bucketeer_Notification_CreateSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_CreateSubscriptionRequest, Bucketeer_Notification_CreateSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/CreateSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to DeleteSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to DeleteSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deleteSubscription(
    _ request: Bucketeer_Notification_DeleteSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_DeleteSubscriptionRequest, Bucketeer_Notification_DeleteSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/DeleteSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to EnableSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to EnableSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func enableSubscription(
    _ request: Bucketeer_Notification_EnableSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_EnableSubscriptionRequest, Bucketeer_Notification_EnableSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/EnableSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to DisableSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to DisableSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func disableSubscription(
    _ request: Bucketeer_Notification_DisableSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_DisableSubscriptionRequest, Bucketeer_Notification_DisableSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/DisableSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }

  /// Unary call to UpdateSubscription
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateSubscription.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateSubscription(
    _ request: Bucketeer_Notification_UpdateSubscriptionRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Bucketeer_Notification_UpdateSubscriptionRequest, Bucketeer_Notification_UpdateSubscriptionResponse> {
    return self.makeUnaryCall(
      path: "/bucketeer.notification.NotificationService/UpdateSubscription",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions
    )
  }
}

internal final class Bucketeer_Notification_NotificationServiceClient: Bucketeer_Notification_NotificationServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions

  /// Creates a client for the bucketeer.notification.NotificationService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  internal init(channel: GRPCChannel, defaultCallOptions: CallOptions = CallOptions()) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
  }
}

