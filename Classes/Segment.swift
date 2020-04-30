//
//  Segment.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/13/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct Segment<T: SegmentBatchCodable>: Codable {
    public var batch: [T]?
}
