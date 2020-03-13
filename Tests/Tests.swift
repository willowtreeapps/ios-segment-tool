//
//  Tests.swift
//  Tests
//
//  Created by Michael Rack on 3/13/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import XCTest

class Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStart() {
        let expectation = XCTestExpectation()
        CharlesClient().startRecording() { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testStop() {
        let expectation = XCTestExpectation()
        CharlesClient().stopRecording() { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testClear() {
        let expectation = XCTestExpectation()
        CharlesClient().clearSession() { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testExport() {
        let expectation = XCTestExpectation()
        CharlesClient().exportData() { (data) in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

}
