import Foundation

public enum BucketeerError: Error {
    case network(String)
    case unknown(String)
}
