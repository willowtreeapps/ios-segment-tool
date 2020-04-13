//
//  SegmentService.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public enum SegmentError: Error {
    case noElementsFound
}
public class SegmentService {
    let client = CharlesClient()
    let decoder = JSONDecoder()
    
    public init() {
        
    }
    
    // Waits in 5 second intervals. Default numberOfTries waits 90 seconds.
    public func checkForSegmentCalls(expectedCallType: String, expectedPageType: String, completion: @escaping (Result<[BatchElement], Error>) -> ()) {
        let client = CharlesClient()
        let service = SegmentService()
        client.exportData(completion: { (data) in
            service.dataToProxyLogIn(from: data!, completion: { (log) in
                service.segmentCallsIn(from: log, completion: { (segmentList) in
                    service.matchingSegmentBatchesIn(
                        completion: { (expectedBatchElements) in
                            if expectedBatchElements.count > 0 {
                                completion(.success(expectedBatchElements))
                            }
                            else {
                                completion(.failure(SegmentError.noElementsFound))
                            }
                    },
                        from: segmentList,
                        expectedCallType: expectedCallType,
                        expectedPageType: expectedPageType
                    )
                })
            })
        })
    }
    
    public func dataToProxyLogIn(from data: Data, completion: @escaping ([ProxyLogElement]) -> Void) {
        guard let log = try? self.decoder.decode([ProxyLogElement].self, from: data) else { return }
        completion(log)
    }
    
    public func segmentCallsIn(from log: [ProxyLogElement], completion: @escaping ([Segment]) -> Void) {
        var segmentList: [Segment] = []
        for element in log {
            if element.host == "api.segment.io" {
                let segmentString = element.request?.body?.text
                let segmentData = segmentString!.data(using: .utf8)!
                let segment = try! self.decoder.decode(Segment.self, from: segmentData)
                segmentList.append(segment)
            }
        }
        completion(segmentList)
    }
    
    public func matchingSegmentBatchesIn(completion: @escaping ([BatchElement]) -> Void, from segmentList: [Segment], expectedCallType: String, expectedPageType: String) {
        var expectedBatchElements: [BatchElement] = []
        for segmentElement in segmentList {
            let batch = segmentElement.batch
            for batchElement in batch ?? [] {
                if batchElement.type == expectedCallType && batchElement.properties?.pageType == expectedPageType {
                    expectedBatchElements.append(batchElement)
                }
            }
        }
        completion(expectedBatchElements)
    }
}
