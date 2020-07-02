// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/account/account.proto
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

struct Bucketeer_Account_Account {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var email: String = String()

  var name: String = String()

  var role: Bucketeer_Account_Account.Role = .viewer

  var disabled: Bool = false

  var createdAt: Int64 = 0

  var updatedAt: Int64 = 0

  var deleted: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum Role: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case viewer // = 0
    case editor // = 1
    case owner // = 2
    case unassigned // = 99
    case UNRECOGNIZED(Int)

    init() {
      self = .viewer
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .viewer
      case 1: self = .editor
      case 2: self = .owner
      case 99: self = .unassigned
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .viewer: return 0
      case .editor: return 1
      case .owner: return 2
      case .unassigned: return 99
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Bucketeer_Account_Account.Role: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Account_Account.Role] = [
    .viewer,
    .editor,
    .owner,
    .unassigned,
  ]
}

#endif  // swift(>=4.2)

struct Bucketeer_Account_EnvironmentRole {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environment: Bucketeer_Environment_Environment {
    get {return _storage._environment ?? Bucketeer_Environment_Environment()}
    set {_uniqueStorage()._environment = newValue}
  }
  /// Returns true if `environment` has been explicitly set.
  var hasEnvironment: Bool {return _storage._environment != nil}
  /// Clears the value of `environment`. Subsequent reads from it will return its default value.
  mutating func clearEnvironment() {_uniqueStorage()._environment = nil}

  var role: Bucketeer_Account_Account.Role {
    get {return _storage._role}
    set {_uniqueStorage()._role = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.account"

extension Bucketeer_Account_Account: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Account"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "email"),
    3: .same(proto: "name"),
    4: .same(proto: "role"),
    5: .same(proto: "disabled"),
    6: .standard(proto: "created_at"),
    7: .standard(proto: "updated_at"),
    8: .same(proto: "deleted"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.email)
      case 3: try decoder.decodeSingularStringField(value: &self.name)
      case 4: try decoder.decodeSingularEnumField(value: &self.role)
      case 5: try decoder.decodeSingularBoolField(value: &self.disabled)
      case 6: try decoder.decodeSingularInt64Field(value: &self.createdAt)
      case 7: try decoder.decodeSingularInt64Field(value: &self.updatedAt)
      case 8: try decoder.decodeSingularBoolField(value: &self.deleted)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.email.isEmpty {
      try visitor.visitSingularStringField(value: self.email, fieldNumber: 2)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 3)
    }
    if self.role != .viewer {
      try visitor.visitSingularEnumField(value: self.role, fieldNumber: 4)
    }
    if self.disabled != false {
      try visitor.visitSingularBoolField(value: self.disabled, fieldNumber: 5)
    }
    if self.createdAt != 0 {
      try visitor.visitSingularInt64Field(value: self.createdAt, fieldNumber: 6)
    }
    if self.updatedAt != 0 {
      try visitor.visitSingularInt64Field(value: self.updatedAt, fieldNumber: 7)
    }
    if self.deleted != false {
      try visitor.visitSingularBoolField(value: self.deleted, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Account_Account, rhs: Bucketeer_Account_Account) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.email != rhs.email {return false}
    if lhs.name != rhs.name {return false}
    if lhs.role != rhs.role {return false}
    if lhs.disabled != rhs.disabled {return false}
    if lhs.createdAt != rhs.createdAt {return false}
    if lhs.updatedAt != rhs.updatedAt {return false}
    if lhs.deleted != rhs.deleted {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Account_Account.Role: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "VIEWER"),
    1: .same(proto: "EDITOR"),
    2: .same(proto: "OWNER"),
    99: .same(proto: "UNASSIGNED"),
  ]
}

extension Bucketeer_Account_EnvironmentRole: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EnvironmentRole"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "environment"),
    2: .same(proto: "role"),
  ]

  fileprivate class _StorageClass {
    var _environment: Bucketeer_Environment_Environment? = nil
    var _role: Bucketeer_Account_Account.Role = .viewer

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _environment = source._environment
      _role = source._role
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._environment)
        case 2: try decoder.decodeSingularEnumField(value: &_storage._role)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._environment {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if _storage._role != .viewer {
        try visitor.visitSingularEnumField(value: _storage._role, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Account_EnvironmentRole, rhs: Bucketeer_Account_EnvironmentRole) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._environment != rhs_storage._environment {return false}
        if _storage._role != rhs_storage._role {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
