//
//  JSON.MetricsEventType.swift
//  Bucketeer2
//
//  Created by Jin Sasaki on 2022/09/07.
//  Copyright © 2022 Bucketeer. All rights reserved.
//

import Foundation

extension JSON {
    enum MetricsEventType: Int, Decodable, Hashable {
        case getEvaluationLatency = 1
        case getEvaluationSize = 2
        case timeoutErrorCount = 3
        case internalErrorCount = 4
    }
}
