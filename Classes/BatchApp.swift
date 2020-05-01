//
//  BatchApp.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct DefaultBatchApp: Codable {
    public var buildNumber: String?
    public var appName: String?
    public var appVersion: String?
    
    enum CodingKeys: String, CodingKey {
        case buildNumber = "build"
        case appName = "name"
        case appVersion = "version"
    }
}
