import Foundation

class Version {
    static let number: String = {
        guard
            let info = Bundle(for: BucketeerSDK.self).infoDictionary,
            let build = info["CFBundleShortVersionString"] as? String
            else { return "Unknown" }
        return build
    }()
}
