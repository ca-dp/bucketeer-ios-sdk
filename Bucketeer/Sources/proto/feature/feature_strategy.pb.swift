// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/feature/strategy.proto
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

struct Bucketeer_Feature_FixedStrategy {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var variation: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Feature_RolloutStrategy {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var variations: [Bucketeer_Feature_RolloutStrategy.Variation] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct Variation {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var variation: String = String()

    var weight: Int32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}
}

struct Bucketeer_Feature_Strategy {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var type: Bucketeer_Feature_Strategy.TypeEnum = .fixed

  var fixedStrategy: Bucketeer_Feature_FixedStrategy {
    get {return _fixedStrategy ?? Bucketeer_Feature_FixedStrategy()}
    set {_fixedStrategy = newValue}
  }
  /// Returns true if `fixedStrategy` has been explicitly set.
  var hasFixedStrategy: Bool {return self._fixedStrategy != nil}
  /// Clears the value of `fixedStrategy`. Subsequent reads from it will return its default value.
  mutating func clearFixedStrategy() {self._fixedStrategy = nil}

  var rolloutStrategy: Bucketeer_Feature_RolloutStrategy {
    get {return _rolloutStrategy ?? Bucketeer_Feature_RolloutStrategy()}
    set {_rolloutStrategy = newValue}
  }
  /// Returns true if `rolloutStrategy` has been explicitly set.
  var hasRolloutStrategy: Bool {return self._rolloutStrategy != nil}
  /// Clears the value of `rolloutStrategy`. Subsequent reads from it will return its default value.
  mutating func clearRolloutStrategy() {self._rolloutStrategy = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum TypeEnum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case fixed // = 0
    case rollout // = 1
    case UNRECOGNIZED(Int)

    init() {
      self = .fixed
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .fixed
      case 1: self = .rollout
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .fixed: return 0
      case .rollout: return 1
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}

  fileprivate var _fixedStrategy: Bucketeer_Feature_FixedStrategy? = nil
  fileprivate var _rolloutStrategy: Bucketeer_Feature_RolloutStrategy? = nil
}

#if swift(>=4.2)

extension Bucketeer_Feature_Strategy.TypeEnum: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Feature_Strategy.TypeEnum] = [
    .fixed,
    .rollout,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.feature"

extension Bucketeer_Feature_FixedStrategy: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FixedStrategy"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "variation"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.variation)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.variation.isEmpty {
      try visitor.visitSingularStringField(value: self.variation, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_FixedStrategy, rhs: Bucketeer_Feature_FixedStrategy) -> Bool {
    if lhs.variation != rhs.variation {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_RolloutStrategy: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RolloutStrategy"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "variations"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.variations)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.variations.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.variations, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_RolloutStrategy, rhs: Bucketeer_Feature_RolloutStrategy) -> Bool {
    if lhs.variations != rhs.variations {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_RolloutStrategy.Variation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Bucketeer_Feature_RolloutStrategy.protoMessageName + ".Variation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "variation"),
    2: .same(proto: "weight"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.variation)
      case 2: try decoder.decodeSingularInt32Field(value: &self.weight)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.variation.isEmpty {
      try visitor.visitSingularStringField(value: self.variation, fieldNumber: 1)
    }
    if self.weight != 0 {
      try visitor.visitSingularInt32Field(value: self.weight, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_RolloutStrategy.Variation, rhs: Bucketeer_Feature_RolloutStrategy.Variation) -> Bool {
    if lhs.variation != rhs.variation {return false}
    if lhs.weight != rhs.weight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_Strategy: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Strategy"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .standard(proto: "fixed_strategy"),
    3: .standard(proto: "rollout_strategy"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularEnumField(value: &self.type)
      case 2: try decoder.decodeSingularMessageField(value: &self._fixedStrategy)
      case 3: try decoder.decodeSingularMessageField(value: &self._rolloutStrategy)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.type != .fixed {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 1)
    }
    if let v = self._fixedStrategy {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if let v = self._rolloutStrategy {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_Strategy, rhs: Bucketeer_Feature_Strategy) -> Bool {
    if lhs.type != rhs.type {return false}
    if lhs._fixedStrategy != rhs._fixedStrategy {return false}
    if lhs._rolloutStrategy != rhs._rolloutStrategy {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_Strategy.TypeEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "FIXED"),
    1: .same(proto: "ROLLOUT"),
  ]
}
