//
//  BatchApp.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

struct BatchApp: Codable {
    var buildNumber: String?
    var appName: String?
    var appVersion: String?
    
    enum CodingKeys: String, CodingKey {
        case buildNumber = "build"
        case appName = "name"
        case appVersion = "version"
    }
}
