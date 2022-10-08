import Foundation

struct Evaluation: Hashable, Codable {
    let id: String
    let feature_id: String
    let feature_version: Int
    let user_id: String
    let variation_id: String
    var variation: Variation
    let reason: Reason
    var variation_value: String
}


extension Evaluation {
    func getVariationValue<T>(defaultValue: T, logger: Logger?) -> T {
        let value = self.variation_value
        let anyValue: Any?
        switch defaultValue {
        case is String:
            anyValue = value
        case is Int:
            anyValue = Int(value)
        case is Int64:
            anyValue = Int64(value)
        case is Float:
            anyValue = Float(value)
        case is Double:
            anyValue = Double(value)
        case is Bool:
            anyValue = Bool(value)
        default:
            anyValue = value
        }
        guard let typedValue = anyValue as? T else {
            logger?.debug(message: "getVariation returns null reason: failed to cast")
            return defaultValue
        }
        return typedValue
    }
}
