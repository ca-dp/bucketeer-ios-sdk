import Foundation

extension JSON {
    enum ReasonType: Int, Decodable, Hashable {
        case target = 0
        case rule = 1
        case `default` = 3
        case client = 4
        case offVariation = 5
        case prerequisite = 6
    }
}
