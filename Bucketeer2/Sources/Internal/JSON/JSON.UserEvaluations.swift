//
//  JSON.UserEvaluations.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    struct UserEvaluations: Decodable {
        let id: String
        let evaluations: [Evaluation]
    }
}
