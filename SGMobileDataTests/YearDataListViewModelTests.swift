//
//  YearDataListViewModelTests.swift
//  SGMobileDataTests
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import XCTest                                                                                                                                                                                                                                                                                                                                                                                                                                                     
@testable import SGMobileData

class YearDataListViewModelTests: XCTestCase {
    
    var sut: YearDataListViewModel!
    var mockMobileDataFetcher: MobileDataFetcher!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = YearDataListViewModel(dataFetcher: MobileDataFetcher())
        mockMobileDataFetcher = MobileDataFetcher()
        sut.viewDidLoad()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut = nil
        mockMobileDataFetcher = nil
    }

    func testOutputAttributes() {
        let tableModel = tableDataModel()
        XCTAssertEqual(sut.numberOfRows, tableModel.count)
    }
    
    func testDataModelForIndexPath() {
        let tableModel = tableDataModel()
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertEqual(tableModel[0], sut.tableCellDataModelForIndexPath(indexPath))
    }
    
    func tableDataModel() -> [YearDataCellModel] {
        var dataModel = [YearDataCellModel]()
        let outputModel = YearDataCellModel(year: "2004", data: 0.25, isDesc: true)
        dataModel.append(outputModel)
        return dataModel
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// MARK: MobileDataFetcher
/// A mock for data fetcher to provide test data.
class MobileDataFetcher: MobileDataFetcherProtocol {
    
    var quarterList = [QuarterData]()
    
    init() {
        let firstQuarter = QuarterData(attributes: [ "volume_of_mobile_data": "0.3", "quarter": "2004-Q3","_id": 1])
        quarterList.append(firstQuarter)
        let secondQuarter = QuarterData(attributes: [ "volume_of_mobile_data": "0.2", "quarter": "2004-Q4","_id": 2])
        quarterList.append(secondQuarter)
    }
    
    func fetchQuarterList(completion: ([QuarterData]?, String?) -> ()) {
        completion(quarterList, nil)
    }
    
}
