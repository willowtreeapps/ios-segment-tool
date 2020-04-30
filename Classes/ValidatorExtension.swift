import Foundation
import XCTest

public extension XCTestCase {
    typealias ValidationFunction<T: SegmentBatchCodable> = (T) -> ()
    func segmentValidator<T: SegmentBatchCodable>(result: Result<[T], Error>, expectation: XCTestExpectation, maxRetries: Int, currentRetries: Int = 0, expectedCallType: String = "screen", expectedPageName: String, validator: @escaping ValidationFunction<T>) {
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
            SegmentService().checkForSegmentCalls(expectedCallType: expectedCallType, expectedPageName: expectedPageName) { [weak self]
                (result) in
                self?.segmentValidator(result: result, expectation: expectation, maxRetries: maxRetries, currentRetries: currentRetries + 1, expectedCallType: expectedCallType, expectedPageName: expectedPageName, validator: validator)
            }
        }
    }
}
