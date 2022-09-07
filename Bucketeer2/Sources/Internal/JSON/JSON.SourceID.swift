//
//  JSON.SourceID.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    enum SourceID: Int, Decodable, Hashable {
        case unknown = 0
        case android = 1
        case ios = 2
        case web = 3
        case goalBatch = 4
        case goServer = 5
        case nodeServer = 6
    }
}
