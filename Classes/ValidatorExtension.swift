import Foundation
import XCTest

public extension XCTestCase {
    typealias ValidationFunction<T: SegmentBatchCodable> = (T) -> ()

    /**
     Repeatedly checks for event calls based on call type and identifier.
     Waits in 5 second intervals. Default numberOfTries waits 90 seconds.

     - Parameters:
        - result: Result from completion handler of initial `checkForSegmentCalls`
        - expectation: Expectation to be fulfilled once result of the check is completed.
        - maxRetries: Maximum number of times to retry checking for expected call.
        - expectedCallType: Type of the call, either screen, track, or identify.
        - expectedIdentifier: This will match against the "name" of screen calls or the "event" of track calls. **Ignored in identify calls.**
        - validator: Completion handler to be performed with the collected calls. Should specify a ValidationFunction with a type conforming to `SegmentBatchCodable`.
     */
    func segmentValidator<T: SegmentBatchCodable>(result: Result<[T], Error>, expectation: XCTestExpectation, maxRetries: Int, currentRetries: Int = 0, expectedCallType: SegmentCallType = .screen, expectedIdentifier: String?, validator: @escaping ValidationFunction<T>) {
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
            SegmentService().checkForSegmentCalls(expectedCallType: expectedCallType, expectedIdentifier: expectedIdentifier) { [weak self]
                (result) in
                self?.segmentValidator(result: result, expectation: expectation, maxRetries: maxRetries, currentRetries: currentRetries + 1, expectedCallType: expectedCallType, expectedIdentifier: expectedIdentifier, validator: validator)
            }
        }
    }
}
