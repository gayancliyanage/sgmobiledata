//
//  YearDataCellModelTests.swift
//  SGMobileDataTests
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import XCTest
@testable import SGMobileData

class YearDataCellModelTests: XCTestCase {

    var sut: YearDataCellModel!
    var quarterDataList: [QuarterData]!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        let attrsOne : [String : Any] =  [ "volume_of_mobile_data": "0.3", "quarter": "2004-Q3","_id": 1]
        let qDOne = QuarterData(attributes: attrsOne)
        let attrsTwo : [String : Any] =  [ "volume_of_mobile_data": "0.2", "quarter": "2004-Q4","_id": 1]
        let qDTwo = QuarterData(attributes: attrsTwo)
        self.quarterDataList = [qDOne, qDTwo]
        
        sut = YearDataCellModel(quarterList: self.quarterDataList)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut = nil
        quarterDataList = nil
    }

    func testAttributes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(sut.year, "Year is nil in YearDataCellModel")
        XCTAssertNotNil(sut.data, "Data is nil in YearDataCellModel")
        XCTAssertNotNil(sut.isDesc, "Is Descending is nil in YearDataCell Model")
        
        XCTAssertEqual(sut.year, "2004")
        XCTAssertEqual(sut.data, 0.25)
        XCTAssertEqual(sut.isDesc, true)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
