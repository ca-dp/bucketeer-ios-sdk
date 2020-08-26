// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/experiment/experiment.proto
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

struct Bucketeer_Experiment_Experiment {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var goalID: String {
    get {return _storage._goalID}
    set {_uniqueStorage()._goalID = newValue}
  }

  var featureID: String {
    get {return _storage._featureID}
    set {_uniqueStorage()._featureID = newValue}
  }

  var featureVersion: Int32 {
    get {return _storage._featureVersion}
    set {_uniqueStorage()._featureVersion = newValue}
  }

  var variations: [Bucketeer_Feature_Variation] {
    get {return _storage._variations}
    set {_uniqueStorage()._variations = newValue}
  }

  var startAt: Int64 {
    get {return _storage._startAt}
    set {_uniqueStorage()._startAt = newValue}
  }

  var stopAt: Int64 {
    get {return _storage._stopAt}
    set {_uniqueStorage()._stopAt = newValue}
  }

  var stopped: Bool {
    get {return _storage._stopped}
    set {_uniqueStorage()._stopped = newValue}
  }

  var stoppedAt: Int64 {
    get {return _storage._stoppedAt}
    set {_uniqueStorage()._stoppedAt = newValue}
  }

  var createdAt: Int64 {
    get {return _storage._createdAt}
    set {_uniqueStorage()._createdAt = newValue}
  }

  var updatedAt: Int64 {
    get {return _storage._updatedAt}
    set {_uniqueStorage()._updatedAt = newValue}
  }

  var deleted: Bool {
    get {return _storage._deleted}
    set {_uniqueStorage()._deleted = newValue}
  }

  var goalIds: [String] {
    get {return _storage._goalIds}
    set {_uniqueStorage()._goalIds = newValue}
  }

  var name: String {
    get {return _storage._name}
    set {_uniqueStorage()._name = newValue}
  }

  var description_p: String {
    get {return _storage._description_p}
    set {_uniqueStorage()._description_p = newValue}
  }

  var baseVariationID: String {
    get {return _storage._baseVariationID}
    set {_uniqueStorage()._baseVariationID = newValue}
  }

  /// This field is set only when APIs return.
  var currentFeature: Bucketeer_Feature_Feature {
    get {return _storage._currentFeature ?? Bucketeer_Feature_Feature()}
    set {_uniqueStorage()._currentFeature = newValue}
  }
  /// Returns true if `currentFeature` has been explicitly set.
  var hasCurrentFeature: Bool {return _storage._currentFeature != nil}
  /// Clears the value of `currentFeature`. Subsequent reads from it will return its default value.
  mutating func clearCurrentFeature() {_uniqueStorage()._currentFeature = nil}

  var status: Bucketeer_Experiment_Experiment.Status {
    get {return _storage._status}
    set {_uniqueStorage()._status = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum Status: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case waiting // = 0
    case running // = 1
    case stopped // = 2
    case forceStopped // = 3
    case UNRECOGNIZED(Int)

    init() {
      self = .waiting
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .waiting
      case 1: self = .running
      case 2: self = .stopped
      case 3: self = .forceStopped
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .waiting: return 0
      case .running: return 1
      case .stopped: return 2
      case .forceStopped: return 3
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=4.2)

extension Bucketeer_Experiment_Experiment.Status: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Bucketeer_Experiment_Experiment.Status] = [
    .waiting,
    .running,
    .stopped,
    .forceStopped,
  ]
}

#endif  // swift(>=4.2)

struct Bucketeer_Experiment_Experiments {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var experiments: [Bucketeer_Experiment_Experiment] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.experiment"

extension Bucketeer_Experiment_Experiment: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Experiment"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "goal_id"),
    3: .standard(proto: "feature_id"),
    4: .standard(proto: "feature_version"),
    5: .same(proto: "variations"),
    6: .standard(proto: "start_at"),
    7: .standard(proto: "stop_at"),
    8: .same(proto: "stopped"),
    9: .standard(proto: "stopped_at"),
    10: .standard(proto: "created_at"),
    11: .standard(proto: "updated_at"),
    12: .same(proto: "deleted"),
    13: .standard(proto: "goal_ids"),
    14: .same(proto: "name"),
    15: .same(proto: "description"),
    16: .standard(proto: "base_variation_id"),
    17: .standard(proto: "current_feature"),
    18: .same(proto: "status"),
  ]

  fileprivate class _StorageClass {
    var _id: String = String()
    var _goalID: String = String()
    var _featureID: String = String()
    var _featureVersion: Int32 = 0
    var _variations: [Bucketeer_Feature_Variation] = []
    var _startAt: Int64 = 0
    var _stopAt: Int64 = 0
    var _stopped: Bool = false
    var _stoppedAt: Int64 = 0
    var _createdAt: Int64 = 0
    var _updatedAt: Int64 = 0
    var _deleted: Bool = false
    var _goalIds: [String] = []
    var _name: String = String()
    var _description_p: String = String()
    var _baseVariationID: String = String()
    var _currentFeature: Bucketeer_Feature_Feature? = nil
    var _status: Bucketeer_Experiment_Experiment.Status = .waiting

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _id = source._id
      _goalID = source._goalID
      _featureID = source._featureID
      _featureVersion = source._featureVersion
      _variations = source._variations
      _startAt = source._startAt
      _stopAt = source._stopAt
      _stopped = source._stopped
      _stoppedAt = source._stoppedAt
      _createdAt = source._createdAt
      _updatedAt = source._updatedAt
      _deleted = source._deleted
      _goalIds = source._goalIds
      _name = source._name
      _description_p = source._description_p
      _baseVariationID = source._baseVariationID
      _currentFeature = source._currentFeature
      _status = source._status
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._id)
        case 2: try decoder.decodeSingularStringField(value: &_storage._goalID)
        case 3: try decoder.decodeSingularStringField(value: &_storage._featureID)
        case 4: try decoder.decodeSingularInt32Field(value: &_storage._featureVersion)
        case 5: try decoder.decodeRepeatedMessageField(value: &_storage._variations)
        case 6: try decoder.decodeSingularInt64Field(value: &_storage._startAt)
        case 7: try decoder.decodeSingularInt64Field(value: &_storage._stopAt)
        case 8: try decoder.decodeSingularBoolField(value: &_storage._stopped)
        case 9: try decoder.decodeSingularInt64Field(value: &_storage._stoppedAt)
        case 10: try decoder.decodeSingularInt64Field(value: &_storage._createdAt)
        case 11: try decoder.decodeSingularInt64Field(value: &_storage._updatedAt)
        case 12: try decoder.decodeSingularBoolField(value: &_storage._deleted)
        case 13: try decoder.decodeRepeatedStringField(value: &_storage._goalIds)
        case 14: try decoder.decodeSingularStringField(value: &_storage._name)
        case 15: try decoder.decodeSingularStringField(value: &_storage._description_p)
        case 16: try decoder.decodeSingularStringField(value: &_storage._baseVariationID)
        case 17: try decoder.decodeSingularMessageField(value: &_storage._currentFeature)
        case 18: try decoder.decodeSingularEnumField(value: &_storage._status)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 1)
      }
      if !_storage._goalID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._goalID, fieldNumber: 2)
      }
      if !_storage._featureID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._featureID, fieldNumber: 3)
      }
      if _storage._featureVersion != 0 {
        try visitor.visitSingularInt32Field(value: _storage._featureVersion, fieldNumber: 4)
      }
      if !_storage._variations.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._variations, fieldNumber: 5)
      }
      if _storage._startAt != 0 {
        try visitor.visitSingularInt64Field(value: _storage._startAt, fieldNumber: 6)
      }
      if _storage._stopAt != 0 {
        try visitor.visitSingularInt64Field(value: _storage._stopAt, fieldNumber: 7)
      }
      if _storage._stopped != false {
        try visitor.visitSingularBoolField(value: _storage._stopped, fieldNumber: 8)
      }
      if _storage._stoppedAt != 0 {
        try visitor.visitSingularInt64Field(value: _storage._stoppedAt, fieldNumber: 9)
      }
      if _storage._createdAt != 0 {
        try visitor.visitSingularInt64Field(value: _storage._createdAt, fieldNumber: 10)
      }
      if _storage._updatedAt != 0 {
        try visitor.visitSingularInt64Field(value: _storage._updatedAt, fieldNumber: 11)
      }
      if _storage._deleted != false {
        try visitor.visitSingularBoolField(value: _storage._deleted, fieldNumber: 12)
      }
      if !_storage._goalIds.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._goalIds, fieldNumber: 13)
      }
      if !_storage._name.isEmpty {
        try visitor.visitSingularStringField(value: _storage._name, fieldNumber: 14)
      }
      if !_storage._description_p.isEmpty {
        try visitor.visitSingularStringField(value: _storage._description_p, fieldNumber: 15)
      }
      if !_storage._baseVariationID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._baseVariationID, fieldNumber: 16)
      }
      if let v = _storage._currentFeature {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 17)
      }
      if _storage._status != .waiting {
        try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 18)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Experiment_Experiment, rhs: Bucketeer_Experiment_Experiment) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._id != rhs_storage._id {return false}
        if _storage._goalID != rhs_storage._goalID {return false}
        if _storage._featureID != rhs_storage._featureID {return false}
        if _storage._featureVersion != rhs_storage._featureVersion {return false}
        if _storage._variations != rhs_storage._variations {return false}
        if _storage._startAt != rhs_storage._startAt {return false}
        if _storage._stopAt != rhs_storage._stopAt {return false}
        if _storage._stopped != rhs_storage._stopped {return false}
        if _storage._stoppedAt != rhs_storage._stoppedAt {return false}
        if _storage._createdAt != rhs_storage._createdAt {return false}
        if _storage._updatedAt != rhs_storage._updatedAt {return false}
        if _storage._deleted != rhs_storage._deleted {return false}
        if _storage._goalIds != rhs_storage._goalIds {return false}
        if _storage._name != rhs_storage._name {return false}
        if _storage._description_p != rhs_storage._description_p {return false}
        if _storage._baseVariationID != rhs_storage._baseVariationID {return false}
        if _storage._currentFeature != rhs_storage._currentFeature {return false}
        if _storage._status != rhs_storage._status {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Experiment_Experiment.Status: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "WAITING"),
    1: .same(proto: "RUNNING"),
    2: .same(proto: "STOPPED"),
    3: .same(proto: "FORCE_STOPPED"),
  ]
}

extension Bucketeer_Experiment_Experiments: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Experiments"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "experiments"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.experiments)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.experiments.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.experiments, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Experiment_Experiments, rhs: Bucketeer_Experiment_Experiments) -> Bool {
    if lhs.experiments != rhs.experiments {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
