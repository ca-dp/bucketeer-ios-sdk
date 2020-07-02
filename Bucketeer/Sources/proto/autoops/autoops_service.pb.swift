// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/autoops/service.proto
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

struct Bucketeer_Autoops_GetAutoOpsRuleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String = String()

  var id: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_GetAutoOpsRuleResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var autoOpsRule: Bucketeer_Autoops_AutoOpsRule {
    get {return _storage._autoOpsRule ?? Bucketeer_Autoops_AutoOpsRule()}
    set {_uniqueStorage()._autoOpsRule = newValue}
  }
  /// Returns true if `autoOpsRule` has been explicitly set.
  var hasAutoOpsRule: Bool {return _storage._autoOpsRule != nil}
  /// Clears the value of `autoOpsRule`. Subsequent reads from it will return its default value.
  mutating func clearAutoOpsRule() {_uniqueStorage()._autoOpsRule = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Bucketeer_Autoops_CreateAutoOpsRuleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String {
    get {return _storage._environmentNamespace}
    set {_uniqueStorage()._environmentNamespace = newValue}
  }

  var command: Bucketeer_Autoops_CreateAutoOpsRuleCommand {
    get {return _storage._command ?? Bucketeer_Autoops_CreateAutoOpsRuleCommand()}
    set {_uniqueStorage()._command = newValue}
  }
  /// Returns true if `command` has been explicitly set.
  var hasCommand: Bool {return _storage._command != nil}
  /// Clears the value of `command`. Subsequent reads from it will return its default value.
  mutating func clearCommand() {_uniqueStorage()._command = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Bucketeer_Autoops_CreateAutoOpsRuleResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_ListAutoOpsRulesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String = String()

  var pageSize: Int64 = 0

  var cursor: String = String()

  var featureIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_ListAutoOpsRulesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var autoOpsRules: [Bucketeer_Autoops_AutoOpsRule] = []

  var cursor: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_DeleteAutoOpsRuleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String {
    get {return _storage._environmentNamespace}
    set {_uniqueStorage()._environmentNamespace = newValue}
  }

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var command: Bucketeer_Autoops_DeleteAutoOpsRuleCommand {
    get {return _storage._command ?? Bucketeer_Autoops_DeleteAutoOpsRuleCommand()}
    set {_uniqueStorage()._command = newValue}
  }
  /// Returns true if `command` has been explicitly set.
  var hasCommand: Bool {return _storage._command != nil}
  /// Clears the value of `command`. Subsequent reads from it will return its default value.
  mutating func clearCommand() {_uniqueStorage()._command = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Bucketeer_Autoops_DeleteAutoOpsRuleResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_UpdateAutoOpsRuleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String {
    get {return _storage._environmentNamespace}
    set {_uniqueStorage()._environmentNamespace = newValue}
  }

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var changeAutoOpsRuleOpsTypeCommand: Bucketeer_Autoops_ChangeAutoOpsRuleOpsTypeCommand {
    get {return _storage._changeAutoOpsRuleOpsTypeCommand ?? Bucketeer_Autoops_ChangeAutoOpsRuleOpsTypeCommand()}
    set {_uniqueStorage()._changeAutoOpsRuleOpsTypeCommand = newValue}
  }
  /// Returns true if `changeAutoOpsRuleOpsTypeCommand` has been explicitly set.
  var hasChangeAutoOpsRuleOpsTypeCommand: Bool {return _storage._changeAutoOpsRuleOpsTypeCommand != nil}
  /// Clears the value of `changeAutoOpsRuleOpsTypeCommand`. Subsequent reads from it will return its default value.
  mutating func clearChangeAutoOpsRuleOpsTypeCommand() {_uniqueStorage()._changeAutoOpsRuleOpsTypeCommand = nil}

  var addOpsEventRateClauseCommands: [Bucketeer_Autoops_AddOpsEventRateClauseCommand] {
    get {return _storage._addOpsEventRateClauseCommands}
    set {_uniqueStorage()._addOpsEventRateClauseCommands = newValue}
  }

  var changeOpsEventRateClauseCommands: [Bucketeer_Autoops_ChangeOpsEventRateClauseCommand] {
    get {return _storage._changeOpsEventRateClauseCommands}
    set {_uniqueStorage()._changeOpsEventRateClauseCommands = newValue}
  }

  var deleteClauseCommands: [Bucketeer_Autoops_DeleteClauseCommand] {
    get {return _storage._deleteClauseCommands}
    set {_uniqueStorage()._deleteClauseCommands = newValue}
  }

  var addDatetimeClauseCommands: [Bucketeer_Autoops_AddDatetimeClauseCommand] {
    get {return _storage._addDatetimeClauseCommands}
    set {_uniqueStorage()._addDatetimeClauseCommands = newValue}
  }

  var changeDatetimeClauseCommands: [Bucketeer_Autoops_ChangeDatetimeClauseCommand] {
    get {return _storage._changeDatetimeClauseCommands}
    set {_uniqueStorage()._changeDatetimeClauseCommands = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Bucketeer_Autoops_UpdateAutoOpsRuleResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Bucketeer_Autoops_ExecuteAutoOpsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var environmentNamespace: String {
    get {return _storage._environmentNamespace}
    set {_uniqueStorage()._environmentNamespace = newValue}
  }

  var id: String {
    get {return _storage._id}
    set {_uniqueStorage()._id = newValue}
  }

  var changeAutoOpsRuleTriggeredAtCommand: Bucketeer_Autoops_ChangeAutoOpsRuleTriggeredAtCommand {
    get {return _storage._changeAutoOpsRuleTriggeredAtCommand ?? Bucketeer_Autoops_ChangeAutoOpsRuleTriggeredAtCommand()}
    set {_uniqueStorage()._changeAutoOpsRuleTriggeredAtCommand = newValue}
  }
  /// Returns true if `changeAutoOpsRuleTriggeredAtCommand` has been explicitly set.
  var hasChangeAutoOpsRuleTriggeredAtCommand: Bool {return _storage._changeAutoOpsRuleTriggeredAtCommand != nil}
  /// Clears the value of `changeAutoOpsRuleTriggeredAtCommand`. Subsequent reads from it will return its default value.
  mutating func clearChangeAutoOpsRuleTriggeredAtCommand() {_uniqueStorage()._changeAutoOpsRuleTriggeredAtCommand = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Bucketeer_Autoops_ExecuteAutoOpsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var alreadyTriggered: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bucketeer.autoops"

extension Bucketeer_Autoops_GetAutoOpsRuleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetAutoOpsRuleRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .same(proto: "id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.environmentNamespace)
      case 2: try decoder.decodeSingularStringField(value: &self.id)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.environmentNamespace.isEmpty {
      try visitor.visitSingularStringField(value: self.environmentNamespace, fieldNumber: 1)
    }
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_GetAutoOpsRuleRequest, rhs: Bucketeer_Autoops_GetAutoOpsRuleRequest) -> Bool {
    if lhs.environmentNamespace != rhs.environmentNamespace {return false}
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_GetAutoOpsRuleResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetAutoOpsRuleResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auto_ops_rule"),
  ]

  fileprivate class _StorageClass {
    var _autoOpsRule: Bucketeer_Autoops_AutoOpsRule? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _autoOpsRule = source._autoOpsRule
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._autoOpsRule)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._autoOpsRule {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_GetAutoOpsRuleResponse, rhs: Bucketeer_Autoops_GetAutoOpsRuleResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._autoOpsRule != rhs_storage._autoOpsRule {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_CreateAutoOpsRuleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateAutoOpsRuleRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .same(proto: "command"),
  ]

  fileprivate class _StorageClass {
    var _environmentNamespace: String = String()
    var _command: Bucketeer_Autoops_CreateAutoOpsRuleCommand? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _environmentNamespace = source._environmentNamespace
      _command = source._command
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._environmentNamespace)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._command)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._environmentNamespace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._environmentNamespace, fieldNumber: 1)
      }
      if let v = _storage._command {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_CreateAutoOpsRuleRequest, rhs: Bucketeer_Autoops_CreateAutoOpsRuleRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._environmentNamespace != rhs_storage._environmentNamespace {return false}
        if _storage._command != rhs_storage._command {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_CreateAutoOpsRuleResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateAutoOpsRuleResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_CreateAutoOpsRuleResponse, rhs: Bucketeer_Autoops_CreateAutoOpsRuleResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_ListAutoOpsRulesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ListAutoOpsRulesRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .standard(proto: "page_size"),
    3: .same(proto: "cursor"),
    4: .standard(proto: "feature_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.environmentNamespace)
      case 2: try decoder.decodeSingularInt64Field(value: &self.pageSize)
      case 3: try decoder.decodeSingularStringField(value: &self.cursor)
      case 4: try decoder.decodeRepeatedStringField(value: &self.featureIds)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.environmentNamespace.isEmpty {
      try visitor.visitSingularStringField(value: self.environmentNamespace, fieldNumber: 1)
    }
    if self.pageSize != 0 {
      try visitor.visitSingularInt64Field(value: self.pageSize, fieldNumber: 2)
    }
    if !self.cursor.isEmpty {
      try visitor.visitSingularStringField(value: self.cursor, fieldNumber: 3)
    }
    if !self.featureIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.featureIds, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_ListAutoOpsRulesRequest, rhs: Bucketeer_Autoops_ListAutoOpsRulesRequest) -> Bool {
    if lhs.environmentNamespace != rhs.environmentNamespace {return false}
    if lhs.pageSize != rhs.pageSize {return false}
    if lhs.cursor != rhs.cursor {return false}
    if lhs.featureIds != rhs.featureIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_ListAutoOpsRulesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ListAutoOpsRulesResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auto_ops_rules"),
    2: .same(proto: "cursor"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.autoOpsRules)
      case 2: try decoder.decodeSingularStringField(value: &self.cursor)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.autoOpsRules.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.autoOpsRules, fieldNumber: 1)
    }
    if !self.cursor.isEmpty {
      try visitor.visitSingularStringField(value: self.cursor, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_ListAutoOpsRulesResponse, rhs: Bucketeer_Autoops_ListAutoOpsRulesResponse) -> Bool {
    if lhs.autoOpsRules != rhs.autoOpsRules {return false}
    if lhs.cursor != rhs.cursor {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_DeleteAutoOpsRuleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DeleteAutoOpsRuleRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .same(proto: "id"),
    3: .same(proto: "command"),
  ]

  fileprivate class _StorageClass {
    var _environmentNamespace: String = String()
    var _id: String = String()
    var _command: Bucketeer_Autoops_DeleteAutoOpsRuleCommand? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _environmentNamespace = source._environmentNamespace
      _id = source._id
      _command = source._command
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._environmentNamespace)
        case 2: try decoder.decodeSingularStringField(value: &_storage._id)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._command)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._environmentNamespace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._environmentNamespace, fieldNumber: 1)
      }
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 2)
      }
      if let v = _storage._command {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_DeleteAutoOpsRuleRequest, rhs: Bucketeer_Autoops_DeleteAutoOpsRuleRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._environmentNamespace != rhs_storage._environmentNamespace {return false}
        if _storage._id != rhs_storage._id {return false}
        if _storage._command != rhs_storage._command {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_DeleteAutoOpsRuleResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DeleteAutoOpsRuleResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_DeleteAutoOpsRuleResponse, rhs: Bucketeer_Autoops_DeleteAutoOpsRuleResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_UpdateAutoOpsRuleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateAutoOpsRuleRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .same(proto: "id"),
    3: .standard(proto: "change_auto_ops_rule_ops_type_command"),
    4: .standard(proto: "add_ops_event_rate_clause_commands"),
    5: .standard(proto: "change_ops_event_rate_clause_commands"),
    6: .standard(proto: "delete_clause_commands"),
    7: .standard(proto: "add_datetime_clause_commands"),
    8: .standard(proto: "change_datetime_clause_commands"),
  ]

  fileprivate class _StorageClass {
    var _environmentNamespace: String = String()
    var _id: String = String()
    var _changeAutoOpsRuleOpsTypeCommand: Bucketeer_Autoops_ChangeAutoOpsRuleOpsTypeCommand? = nil
    var _addOpsEventRateClauseCommands: [Bucketeer_Autoops_AddOpsEventRateClauseCommand] = []
    var _changeOpsEventRateClauseCommands: [Bucketeer_Autoops_ChangeOpsEventRateClauseCommand] = []
    var _deleteClauseCommands: [Bucketeer_Autoops_DeleteClauseCommand] = []
    var _addDatetimeClauseCommands: [Bucketeer_Autoops_AddDatetimeClauseCommand] = []
    var _changeDatetimeClauseCommands: [Bucketeer_Autoops_ChangeDatetimeClauseCommand] = []

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _environmentNamespace = source._environmentNamespace
      _id = source._id
      _changeAutoOpsRuleOpsTypeCommand = source._changeAutoOpsRuleOpsTypeCommand
      _addOpsEventRateClauseCommands = source._addOpsEventRateClauseCommands
      _changeOpsEventRateClauseCommands = source._changeOpsEventRateClauseCommands
      _deleteClauseCommands = source._deleteClauseCommands
      _addDatetimeClauseCommands = source._addDatetimeClauseCommands
      _changeDatetimeClauseCommands = source._changeDatetimeClauseCommands
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._environmentNamespace)
        case 2: try decoder.decodeSingularStringField(value: &_storage._id)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._changeAutoOpsRuleOpsTypeCommand)
        case 4: try decoder.decodeRepeatedMessageField(value: &_storage._addOpsEventRateClauseCommands)
        case 5: try decoder.decodeRepeatedMessageField(value: &_storage._changeOpsEventRateClauseCommands)
        case 6: try decoder.decodeRepeatedMessageField(value: &_storage._deleteClauseCommands)
        case 7: try decoder.decodeRepeatedMessageField(value: &_storage._addDatetimeClauseCommands)
        case 8: try decoder.decodeRepeatedMessageField(value: &_storage._changeDatetimeClauseCommands)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._environmentNamespace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._environmentNamespace, fieldNumber: 1)
      }
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 2)
      }
      if let v = _storage._changeAutoOpsRuleOpsTypeCommand {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if !_storage._addOpsEventRateClauseCommands.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._addOpsEventRateClauseCommands, fieldNumber: 4)
      }
      if !_storage._changeOpsEventRateClauseCommands.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._changeOpsEventRateClauseCommands, fieldNumber: 5)
      }
      if !_storage._deleteClauseCommands.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._deleteClauseCommands, fieldNumber: 6)
      }
      if !_storage._addDatetimeClauseCommands.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._addDatetimeClauseCommands, fieldNumber: 7)
      }
      if !_storage._changeDatetimeClauseCommands.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._changeDatetimeClauseCommands, fieldNumber: 8)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_UpdateAutoOpsRuleRequest, rhs: Bucketeer_Autoops_UpdateAutoOpsRuleRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._environmentNamespace != rhs_storage._environmentNamespace {return false}
        if _storage._id != rhs_storage._id {return false}
        if _storage._changeAutoOpsRuleOpsTypeCommand != rhs_storage._changeAutoOpsRuleOpsTypeCommand {return false}
        if _storage._addOpsEventRateClauseCommands != rhs_storage._addOpsEventRateClauseCommands {return false}
        if _storage._changeOpsEventRateClauseCommands != rhs_storage._changeOpsEventRateClauseCommands {return false}
        if _storage._deleteClauseCommands != rhs_storage._deleteClauseCommands {return false}
        if _storage._addDatetimeClauseCommands != rhs_storage._addDatetimeClauseCommands {return false}
        if _storage._changeDatetimeClauseCommands != rhs_storage._changeDatetimeClauseCommands {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_UpdateAutoOpsRuleResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateAutoOpsRuleResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_UpdateAutoOpsRuleResponse, rhs: Bucketeer_Autoops_UpdateAutoOpsRuleResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_ExecuteAutoOpsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExecuteAutoOpsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "environment_namespace"),
    2: .same(proto: "id"),
    3: .standard(proto: "change_auto_ops_rule_triggered_at_command"),
  ]

  fileprivate class _StorageClass {
    var _environmentNamespace: String = String()
    var _id: String = String()
    var _changeAutoOpsRuleTriggeredAtCommand: Bucketeer_Autoops_ChangeAutoOpsRuleTriggeredAtCommand? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _environmentNamespace = source._environmentNamespace
      _id = source._id
      _changeAutoOpsRuleTriggeredAtCommand = source._changeAutoOpsRuleTriggeredAtCommand
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
        case 1: try decoder.decodeSingularStringField(value: &_storage._environmentNamespace)
        case 2: try decoder.decodeSingularStringField(value: &_storage._id)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._changeAutoOpsRuleTriggeredAtCommand)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !_storage._environmentNamespace.isEmpty {
        try visitor.visitSingularStringField(value: _storage._environmentNamespace, fieldNumber: 1)
      }
      if !_storage._id.isEmpty {
        try visitor.visitSingularStringField(value: _storage._id, fieldNumber: 2)
      }
      if let v = _storage._changeAutoOpsRuleTriggeredAtCommand {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_ExecuteAutoOpsRequest, rhs: Bucketeer_Autoops_ExecuteAutoOpsRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._environmentNamespace != rhs_storage._environmentNamespace {return false}
        if _storage._id != rhs_storage._id {return false}
        if _storage._changeAutoOpsRuleTriggeredAtCommand != rhs_storage._changeAutoOpsRuleTriggeredAtCommand {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bucketeer_Autoops_ExecuteAutoOpsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExecuteAutoOpsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "already_triggered"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self.alreadyTriggered)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.alreadyTriggered != false {
      try visitor.visitSingularBoolField(value: self.alreadyTriggered, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bucketeer_Autoops_ExecuteAutoOpsResponse, rhs: Bucketeer_Autoops_ExecuteAutoOpsResponse) -> Bool {
    if lhs.alreadyTriggered != rhs.alreadyTriggered {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
