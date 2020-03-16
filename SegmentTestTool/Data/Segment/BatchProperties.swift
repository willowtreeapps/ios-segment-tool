//
//  BatchProperties.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

struct BatchProperties: Codable {
        var pageName: String?
        var appVersion: String?
        var pushEnabled: Bool?
        var primaryBusinessUnit: String?
        var secondaryBusinessUnit: String?
        var appBuild: String?
        var pageLoginState: String?
        var pageIsDarkMode: Bool?
        var appPlatform: String?
        var appName: String?
        var pageType: String?
    
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
