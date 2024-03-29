// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/feature/segment.proto
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

struct Bucketeer_Feature_Segment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var name: String = String()

  var description_p: String = String()

  var rules: [Bucketeer_Feature_Rule] = []

  var createdAt: Int64 = 0

  var updatedAt: Int64 = 0

  var version: Int64 = 0

  var deleted: Bool = false

  var includedUserCount: Int64 = 0

  var excludedUserCount: Int64 = 0

  var status: Bucketeer_Feature_Segment.Status = .initial

  /// This field is set only when APIs return.
  var isInUseStatus: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum Status: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case initial // = 0
    case uploading // = 1
    case suceeded // = 2
    case failed // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .initial
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .initial
      case 1: self = .uploading
      case 2: self = .suceeded
      case 3: self = .failed
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .initial: return 0
      case .uploading: return 1
      case .suceeded: return 2
      case .failed: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Bucketeer_Feature_Segment.Status: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Feature_Segment.Status] = [
    .initial,
    .uploading,
    .suceeded,
    .failed,
  ]
}

#endif  // swift(>=4.2)

struct Bucketeer_Feature_SegmentUser {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var segmentID: String = String()

  var userID: String = String()

  var state: Bucketeer_Feature_SegmentUser.State = .included

  var deleted: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum State: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case included // = 0
    case excluded // = 1
    case UNRECOGNIZED(Int)

    init() {
      self = .included
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .included
      case 1: self = .excluded
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .included: return 0
      case .excluded: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Bucketeer_Feature_SegmentUser.State: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Feature_SegmentUser.State] = [
    .included,
    .excluded,
  ]
}

#endif  // swift(>=4.2)

struct Bucketeer_Feature_SegmentUsers {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var segmentID: String = String()

  var users: [Bucketeer_Feature_SegmentUser] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.feature"

extension Bucketeer_Feature_Segment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Segment"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "description"),
    4: .same(proto: "rules"),
    5: .standard(proto: "created_at"),
    6: .standard(proto: "updated_at"),
    7: .same(proto: "version"),
    8: .same(proto: "deleted"),
    9: .standard(proto: "included_user_count"),
    10: .standard(proto: "excluded_user_count"),
    11: .same(proto: "status"),
    12: .standard(proto: "is_in_use_status"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.name)
      case 3: try decoder.decodeSingularStringField(value: &self.description_p)
      case 4: try decoder.decodeRepeatedMessageField(value: &self.rules)
      case 5: try decoder.decodeSingularInt64Field(value: &self.createdAt)
      case 6: try decoder.decodeSingularInt64Field(value: &self.updatedAt)
      case 7: try decoder.decodeSingularInt64Field(value: &self.version)
      case 8: try decoder.decodeSingularBoolField(value: &self.deleted)
      case 9: try decoder.decodeSingularInt64Field(value: &self.includedUserCount)
      case 10: try decoder.decodeSingularInt64Field(value: &self.excludedUserCount)
      case 11: try decoder.decodeSingularEnumField(value: &self.status)
      case 12: try decoder.decodeSingularBoolField(value: &self.isInUseStatus)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 3)
    }
    if !self.rules.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.rules, fieldNumber: 4)
    }
    if self.createdAt != 0 {
      try visitor.visitSingularInt64Field(value: self.createdAt, fieldNumber: 5)
    }
    if self.updatedAt != 0 {
      try visitor.visitSingularInt64Field(value: self.updatedAt, fieldNumber: 6)
    }
    if self.version != 0 {
      try visitor.visitSingularInt64Field(value: self.version, fieldNumber: 7)
    }
    if self.deleted != false {
      try visitor.visitSingularBoolField(value: self.deleted, fieldNumber: 8)
    }
    if self.includedUserCount != 0 {
      try visitor.visitSingularInt64Field(value: self.includedUserCount, fieldNumber: 9)
    }
    if self.excludedUserCount != 0 {
      try visitor.visitSingularInt64Field(value: self.excludedUserCount, fieldNumber: 10)
    }
    if self.status != .initial {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 11)
    }
    if self.isInUseStatus != false {
      try visitor.visitSingularBoolField(value: self.isInUseStatus, fieldNumber: 12)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_Segment, rhs: Bucketeer_Feature_Segment) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.rules != rhs.rules {return false}
    if lhs.createdAt != rhs.createdAt {return false}
    if lhs.updatedAt != rhs.updatedAt {return false}
    if lhs.version != rhs.version {return false}
    if lhs.deleted != rhs.deleted {return false}
    if lhs.includedUserCount != rhs.includedUserCount {return false}
    if lhs.excludedUserCount != rhs.excludedUserCount {return false}
    if lhs.status != rhs.status {return false}
    if lhs.isInUseStatus != rhs.isInUseStatus {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_Segment.Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "INITIAL"),
    1: .same(proto: "UPLOADING"),
    2: .same(proto: "SUCEEDED"),
    3: .same(proto: "FAILED"),
  ]
}

extension Bucketeer_Feature_SegmentUser: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SegmentUser"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "segment_id"),
    3: .standard(proto: "user_id"),
    4: .same(proto: "state"),
    5: .same(proto: "deleted"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.segmentID)
      case 3: try decoder.decodeSingularStringField(value: &self.userID)
      case 4: try decoder.decodeSingularEnumField(value: &self.state)
      case 5: try decoder.decodeSingularBoolField(value: &self.deleted)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.segmentID.isEmpty {
      try visitor.visitSingularStringField(value: self.segmentID, fieldNumber: 2)
    }
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 3)
    }
    if self.state != .included {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 4)
    }
    if self.deleted != false {
      try visitor.visitSingularBoolField(value: self.deleted, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_SegmentUser, rhs: Bucketeer_Feature_SegmentUser) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.segmentID != rhs.segmentID {return false}
    if lhs.userID != rhs.userID {return false}
    if lhs.state != rhs.state {return false}
    if lhs.deleted != rhs.deleted {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_SegmentUser.State: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "INCLUDED"),
    1: .same(proto: "EXCLUDED"),
  ]
}

extension Bucketeer_Feature_SegmentUsers: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SegmentUsers"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "segment_id"),
    2: .same(proto: "users"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.segmentID)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.users)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.segmentID.isEmpty {
      try visitor.visitSingularStringField(value: self.segmentID, fieldNumber: 1)
    }
    if !self.users.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.users, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_SegmentUsers, rhs: Bucketeer_Feature_SegmentUsers) -> Bool {
    if lhs.segmentID != rhs.segmentID {return false}
    if lhs.users != rhs.users {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
