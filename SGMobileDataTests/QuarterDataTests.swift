//
//  QuarterDataTests.swift
//  SGMobileDataTests
//
//  Created by Gayan Liyanage on 17/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import XCTest
@testable import SGMobileData

class QuarterDataTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAttributes() {
        // This is an example of a functional test case.
        let attributes : [String : Any] =  [ "volume_of_mobile_data": "0.000384", "quarter": "2004-Q3","_id": 1]
        let quarterData = QuarterData(attributes: attributes)
        
        XCTAssertEqual(quarterData.year, "2004")
        XCTAssertEqual(quarterData.quarter, 3)
        XCTAssertEqual(quarterData.data, 0.000384)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let attributes : [String : Any] =  [ "volume_of_mobile_data": "0.000384", "quarter": "2004-Q3","_id": 1]
            _ = QuarterData(attributes: attributes)
        }
    }

}
