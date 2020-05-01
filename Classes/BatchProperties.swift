//
//  BatchProperties.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct DefaultBatchProperties: Codable {
        public var pageName: String?
        public var appVersion: String?
        public var pushEnabled: Bool?
        public var primaryBusinessUnit: String?
        public var secondaryBusinessUnit: String?
        public var appBuild: String?
        public var pageLoginState: String?
        public var pageIsDarkMode: Bool?
        public var appPlatform: String?
        public var appName: String?
        public var pageType: String?
    
    enum CodingKeys: String, CodingKey {
        case pageName = "page_name"
        case appVersion = "app_version"
        case pushEnabled = "push_enabled"
        case primaryBusinessUnit = "primary_business_unit"
        case secondaryBusinessUnit = "secondary_business_unit"
        case appBuild = "app_build"
        case pageLoginState = "page_login_state"
        case pageIsDarkMode = "page_is_dark_mode"
        case appPlatform = "app_platform"
        case appName = "app_name"
        case pageType = "page_type"
    }
}
