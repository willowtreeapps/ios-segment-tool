//
//  ProxyLog.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/13/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

struct ProxyLog: Codable {
    var status: String?
    var host: String?
    var path: String?
    var request: ProxyLogRequest?
}
