//
//  JSON.ReasonType.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

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
