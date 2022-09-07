//
//  JSON.Eletuation.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct Evaluation: Decodable {
        let id: String
        let feature_id: String
        let feature_version: Int
        let user_id: String
        let variation_id: String
        let variation: Variation
        let reason: Reason
        let variation_value: String
    }
}
