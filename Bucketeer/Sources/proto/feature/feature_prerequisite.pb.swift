// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/feature/prerequisite.proto
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

struct Bucketeer_Feature_Prerequisite {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var featureID: String = String()

  var variationID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.feature"

extension Bucketeer_Feature_Prerequisite: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Prerequisite"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "feature_id"),
    2: .standard(proto: "variation_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.featureID)
      case 2: try decoder.decodeSingularStringField(value: &self.variationID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.featureID.isEmpty {
      try visitor.visitSingularStringField(value: self.featureID, fieldNumber: 1)
    }
    if !self.variationID.isEmpty {
      try visitor.visitSingularStringField(value: self.variationID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_Prerequisite, rhs: Bucketeer_Feature_Prerequisite) -> Bool {
    if lhs.featureID != rhs.featureID {return false}
    if lhs.variationID != rhs.variationID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
