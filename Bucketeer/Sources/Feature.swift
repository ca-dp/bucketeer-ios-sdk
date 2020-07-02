import Foundation

/// Feature flag type with generic variation that contains "feature id" and its "default value".
public struct Feature<Variation: VariationProtocol> {
    public let id: String
    public let defaultValue: Variation

    public init(id: String, defaultValue: Variation) {
        self.id = id
        self.defaultValue = defaultValue
    }
}
