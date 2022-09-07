//
//  JSON.EventType.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    enum EventType: Int, Decodable {
        case goal = 1
        // case goal_batch = 2 not used in Client SDK
        case evaluation = 3
        case metrics = 4
    }
}
