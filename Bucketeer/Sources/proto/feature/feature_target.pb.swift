// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/feature/target.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Bucketeer_Feature_Target {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var variation: String = String()

  var users: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.feature"

extension Bucketeer_Feature_Target: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Target"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "variation"),
    2: .same(proto: "users"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.variation)
      case 2: try decoder.decodeRepeatedStringField(value: &self.users)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.variation.isEmpty {
      try visitor.visitSingularStringField(value: self.variation, fieldNumber: 1)
    }
    if !self.users.isEmpty {
      try visitor.visitRepeatedStringField(value: self.users, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_Target, rhs: Bucketeer_Feature_Target) -> Bool {
    if lhs.variation != rhs.variation {return false}
    if lhs.users != rhs.users {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
