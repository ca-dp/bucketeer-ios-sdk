// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/eventcounter/experiment_result.proto
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

struct Bucketeer_Eventcounter_ExperimentResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var experimentID: String = String()

  var updatedAt: Int64 = 0

  var goalResults: [Bucketeer_Eventcounter_GoalResult] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.eventcounter"

extension Bucketeer_Eventcounter_ExperimentResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExperimentResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "experiment_id"),
    3: .standard(proto: "updated_at"),
    4: .standard(proto: "goal_results"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.experimentID)
      case 3: try decoder.decodeSingularInt64Field(value: &self.updatedAt)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.goalResults)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.experimentID.isEmpty {
      try visitor.visitSingularStringField(value: self.experimentID, fieldNumber: 2)
    }
    if self.updatedAt != 0 {
      try visitor.visitSingularInt64Field(value: self.updatedAt, fieldNumber: 3)
    }
    if !self.goalResults.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.goalResults, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Eventcounter_ExperimentResult, rhs: Bucketeer_Eventcounter_ExperimentResult) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.experimentID != rhs.experimentID {return false}
    if lhs.updatedAt != rhs.updatedAt {return false}
    if lhs.goalResults != rhs.goalResults {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}