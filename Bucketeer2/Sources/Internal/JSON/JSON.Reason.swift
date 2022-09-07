//
//  JSON.Reason.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct Reason: Decodable, Hashable {
        let type: ReasonType
        let rule_id: String
    }
}
