//
//  SegmentService.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/16/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

public typealias SegmentResult<T: SegmentBatchCodable> = Result<[T], Error>
public typealias DefaultSegmentResult = SegmentResult<DefaultBatchElement>

public enum SegmentError: Error {
    case noElementsFound
}
public class SegmentService {
    let client = CharlesClient()
    let decoder = JSONDecoder()
    
    public init() {
        
    }
    
    /**
     Checks for event calls based on call type and identifier.

     - Parameters:
        - expectedCallType: Type of the call, either screen, track, or identify.
        - expectedIdentifier: This will match against the "name" of screen calls or the "event" of track calls. **Ignored in identify calls.**
        - completion: Completion handler to be performed with the collected calls. Should specify a type conforming to `SegmentBatchCodable`.
     */
    public func checkForSegmentCalls<T: SegmentBatchCodable>(expectedCallType: SegmentCallType, expectedIdentifier: String?, completion: @escaping (Result<[T], Error>) -> ()) {
        let client = CharlesClient()
        let service = SegmentService()
        client.exportData(completion: { (data) in
            service.dataToProxyLogIn(from: data!, completion: { (log) in
                service.segmentCallsIn(from: log, completion: { (segmentList: [Segment<T>]) in
                    service.matchingSegmentBatchesIn(
                        completion: { (expectedBatchElements: [T]) in
                            if expectedBatchElements.count > 0 {
                                completion(.success(expectedBatchElements))
                            }
                            else {
                                completion(.failure(SegmentError.noElementsFound))
                            }
                    },
                        from: segmentList,
                        expectedCallType: expectedCallType,
                        expectedIdentifier: expectedIdentifier
                    )
                })
            })
        })
    }
    
    public func dataToProxyLogIn(from data: Data, completion: @escaping ([ProxyLogElement]) -> Void) {
        guard let log = try? self.decoder.decode([ProxyLogElement].self, from: data) else { return }
        completion(log)
    }
    
    public func segmentCallsIn<T: SegmentBatchCodable>(from log: [ProxyLogElement], completion: @escaping ([Segment<T>]) -> Void) {
        var segmentList: [Segment<T>] = []
        for element in log {
            if element.host == "api.segment.io" {
                let segmentString = element.request?.body?.text
                let segmentData = segmentString!.data(using: .utf8)!
                let segment = try! self.decoder.decode(Segment<T>.self, from: segmentData)
                segmentList.append(segment)
            }
        }
        completion(segmentList)
    }
    
    public func matchingSegmentBatchesIn<T: SegmentBatchCodable>(completion: @escaping ([T]) -> Void, from segmentList: [Segment<T>], expectedCallType: SegmentCallType, expectedIdentifier: String?) {
        var expectedBatchElements: [T] = []
        for segmentElement in segmentList {
            let batch = segmentElement.batch
            for batchElement in batch ?? [] {
                if batchElement.type == expectedCallType.rawValue {
                    switch expectedCallType {
                    case .screen:
                        if batchElement.name == expectedIdentifier {
                            expectedBatchElements.append(batchElement)
                        }

                    case .track:
                        if batchElement.event == expectedIdentifier {
                            expectedBatchElements.append(batchElement)
                        }

                    case .identify:
                        expectedBatchElements.append(batchElement)
                    }
                }
            }
        }
        completion(expectedBatchElements)
    }
}
