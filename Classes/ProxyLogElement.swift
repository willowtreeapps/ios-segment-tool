//
//  ProxyLog.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/13/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct ProxyLogElement: Codable {
    public var status: String?
    public var host: String?
    public var path: String?
    public var request: ProxyLogRequest?
}
