//
//  BatchElement.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public struct DefaultBatchElement: SegmentBatchCodable {
    public var app: DefaultBatchApp?
    public var traits: DefaultBatchTraits?
    public var properties: DefaultBatchProperties?
    public var type: String?
    public var name: String?
    public var event: String?
}
