import Foundation

/// Variation of feature for converting string-based server value to custom type.
public protocol VariationProtocol {
    static func variationValue(_ serverValue: String) -> Self?
}

extension Bool: VariationProtocol {
    public static func variationValue(_ serverValue: String) -> Bool? {
        return NSString(string: serverValue).boolValue
    }
}

extension Int: VariationProtocol {
    public static func variationValue(_ serverValue: String) -> Int? {
        return Int(serverValue)
    }
}

extension Float: VariationProtocol {
    public static func variationValue(_ serverValue: String) -> Float? {
        return Float(serverValue)
    }
}

extension String: VariationProtocol {
    public static func variationValue(_ serverValue: String) -> String? {
        return serverValue
    }
}

extension VariationProtocol where Self: RawRepresentable, Self.RawValue: VariationProtocol {
    public static func variationValue(_ serverValue: String) -> Self? {
        guard let rawValue = RawValue.variationValue(serverValue) else { return nil }
        return Self.init(rawValue: rawValue)
    }
}
