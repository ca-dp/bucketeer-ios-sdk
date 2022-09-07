//
//  JSON.User.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct User: Decodable, Hashable {
        let id: String
        let data: [String: String]
        // note: tagged_data is not used in client SDK
    }
}
