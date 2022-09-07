//
//  JSON.UserEvaluationsState.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    enum UserEvaluationsState: Int {
        case queued = 0
        case partial = 1
        case full =  2
    }
}
