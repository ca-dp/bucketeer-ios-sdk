// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/feature/clause.proto
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

struct Bucketeer_Feature_Clause {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var attribute: String = String()

  var `operator`: Bucketeer_Feature_Clause.Operator = .equals

  var values: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum Operator: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case equals // = 0
    case `in` // = 1
    case endsWith // = 2
    case startsWith // = 3
    case segment // = 4
    case greater // = 5
    case greaterOrEqual // = 6
    case less // = 7
    case lessOrEqual // = 8
    case before // = 9
    case after // = 10
    case UNRECOGNIZED(Int)

    init() {
      self = .equals
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .equals
      case 1: self = .in
      case 2: self = .endsWith
      case 3: self = .startsWith
      case 4: self = .segment
      case 5: self = .greater
      case 6: self = .greaterOrEqual
      case 7: self = .less
      case 8: self = .lessOrEqual
      case 9: self = .before
      case 10: self = .after
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .equals: return 0
      case .in: return 1
      case .endsWith: return 2
      case .startsWith: return 3
      case .segment: return 4
      case .greater: return 5
      case .greaterOrEqual: return 6
      case .less: return 7
      case .lessOrEqual: return 8
      case .before: return 9
      case .after: return 10
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Bucketeer_Feature_Clause.Operator: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Feature_Clause.Operator] = [
    .equals,
    .in,
    .endsWith,
    .startsWith,
    .segment,
    .greater,
    .greaterOrEqual,
    .less,
    .lessOrEqual,
    .before,
    .after,
  ]
}

#endif  // swift(>=4.2)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.feature"

extension Bucketeer_Feature_Clause: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Clause"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "attribute"),
    3: .same(proto: "operator"),
    4: .same(proto: "values"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.id)
      case 2: try decoder.decodeSingularStringField(value: &self.attribute)
      case 3: try decoder.decodeSingularEnumField(value: &self.`operator`)
      case 4: try decoder.decodeRepeatedStringField(value: &self.values)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.attribute.isEmpty {
      try visitor.visitSingularStringField(value: self.attribute, fieldNumber: 2)
    }
    if self.`operator` != .equals {
      try visitor.visitSingularEnumField(value: self.`operator`, fieldNumber: 3)
    }
    if !self.values.isEmpty {
      try visitor.visitRepeatedStringField(value: self.values, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Feature_Clause, rhs: Bucketeer_Feature_Clause) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.attribute != rhs.attribute {return false}
    if lhs.`operator` != rhs.`operator` {return false}
    if lhs.values != rhs.values {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Feature_Clause.Operator: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "EQUALS"),
    1: .same(proto: "IN"),
    2: .same(proto: "ENDS_WITH"),
    3: .same(proto: "STARTS_WITH"),
    4: .same(proto: "SEGMENT"),
    5: .same(proto: "GREATER"),
    6: .same(proto: "GREATER_OR_EQUAL"),
    7: .same(proto: "LESS"),
    8: .same(proto: "LESS_OR_EQUAL"),
    9: .same(proto: "BEFORE"),
    10: .same(proto: "AFTER"),
  ]
}
