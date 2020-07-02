// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/environment/environment.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Bucketeer_Environment_Environment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var namespace: String = String()

  var name: String = String()

  /// optional
  var description_p: String = String()

  var deleted: Bool = false

  var createdAt: Int64 = 0

  var updatedAt: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.environment"

extension Bucketeer_Environment_Environment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Environment"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "namespace"),
    3: .same(proto: "name"),
    4: .same(proto: "description"),
    5: .same(proto: "deleted"),
    6: .standard(proto: "created_at"),
    7: .standard(proto: "updated_at"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.namespace)
      case 3: try decoder.decodeSingularStringField(value: &self.name)
      case 4: try decoder.decodeSingularStringField(value: &self.description_p)
      case 5: try decoder.decodeSingularBoolField(value: &self.deleted)
      case 6: try decoder.decodeSingularInt64Field(value: &self.createdAt)
      case 7: try decoder.decodeSingularInt64Field(value: &self.updatedAt)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.namespace.isEmpty {
      try visitor.visitSingularStringField(value: self.namespace, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 4)
    }
    if self.deleted != false {
      try visitor.visitSingularBoolField(value: self.deleted, fieldNumber: 5)
    }
    if self.createdAt != 0 {
      try visitor.visitSingularInt64Field(value: self.createdAt, fieldNumber: 6)
    }
    if self.updatedAt != 0 {
      try visitor.visitSingularInt64Field(value: self.updatedAt, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Environment_Environment, rhs: Bucketeer_Environment_Environment) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.namespace != rhs.namespace {return false}
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.deleted != rhs.deleted {return false}
    if lhs.createdAt != rhs.createdAt {return false}
    if lhs.updatedAt != rhs.updatedAt {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
