import BucketeerTVOS

/// Namespace protocol for better `static var` member type inference.
protocol _Feature {}

extension Feature: _Feature {
    static var customStringFeature: Feature<CustomStringVariation> {
        return .init(id: "ios_test_004", defaultValue: .superFeature)
    }

    static var customIntFeature: Feature<CustomIntVariation> {
        return .init(id: "ios_test_005", defaultValue: .megaFeature)
    }
}

enum CustomStringVariation: String, VariationProtocol {
    case superFeature = "feature1"
    case ultraFeature = "feature2"
    case hyperFeature = "feature3"
}

enum CustomIntVariation: Int, VariationProtocol {
    case megaFeature = 111
    case gigaFeature = 222
    case teraFeature = 333
}
