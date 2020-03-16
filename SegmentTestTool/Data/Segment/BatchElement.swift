//
//  BatchElement.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

struct BatchElement: Codable {
    var app: BatchApp?
    var traits: BatchTraits?
    var properties: BatchProperties?
}
