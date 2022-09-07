//
//  JSON.Variation.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct Variation: Decodable {
        let id: String
        let value: String
        let name: String?
        let description: String?
    }
}
