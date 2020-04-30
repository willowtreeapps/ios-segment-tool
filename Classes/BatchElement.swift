//
//  BatchElement.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct BatchElement: SegmentBatchCodable {
    public var app: BatchApp?
    public var traits: BatchTraits?
    public var properties: BatchProperties?
    public var type: String?
    public var name: String?
}
