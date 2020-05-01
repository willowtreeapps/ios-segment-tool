//
//  SegmentBatchCodable.swift
//  ios-segment-tool
//
//  Created by Samuel Lambert on 4/29/20.
//

import Foundation

public protocol SegmentBatchCodable: Codable {
    var type: String? { get }
    var name: String? { get }
    var event: String? { get }
}
