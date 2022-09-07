//
//  JSON.Duration.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct Duration: Decodable, Hashable {
        let seconds: Int64
        let nanos: Int64
    }
}
