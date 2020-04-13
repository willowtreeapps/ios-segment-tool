import Foundation
import XCTest

public extension XCTestCase {
    typealias ValidationFunction = (BatchElement) -> ()
    func segmentValidator(result: Result<[BatchElement], Error>, expectation: XCTestExpectation, maxRetries: Int, currentRetries: Int = 0, expectedCallType: String = "screen", expectedPageType: String, validator: @escaping ValidationFunction) {
        switch result {
        case .success(let finalResult):
            XCTAssertFalse(finalResult.isEmpty)
            finalResult.forEach(validator)
            expectation.fulfill()
        case .failure:
            sleep(5)
            guard currentRetries < maxRetries else {
                XCTFail()
                expectation.fulfill()
                return
            }
            SegmentService().checkForSegmentCalls(expectedCallType: expectedCallType, expectedPageType: expectedPageType) { [weak self]
                (result) in
                self?.segmentValidator(result: result, expectation: expectation, maxRetries: maxRetries, currentRetries: currentRetries + 1, expectedCallType: expectedCallType, expectedPageType: expectedPageType, validator: validator)
            }
        }
    }
}
