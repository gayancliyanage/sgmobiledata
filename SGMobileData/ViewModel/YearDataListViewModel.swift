//
//  YearDataListViewModel.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import UIKit

class YearDataListViewModel {
    
    var dataFetcher: MobileDataFetcherProtocol!
    
    // Output
    var displayError:(String)->() = { _ in }
    var numberOfRows = 0
    
    // Input
    var viewDidLoad: () -> () = { }
    
    private var tableDataSource = [YearDataCellModel]()
    private var dataModel: [YearDataCellModel]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
    
    init(dataFetcher: MobileDataFetcherProtocol) {
        self.dataFetcher = dataFetcher
        viewDidLoad = { [weak self] in
            self?.getMobileData()
        }
    }
    
    private func getMobileData() {
        dataFetcher.fetchQuarterList { [weak self] (quarterList, errorMessage) in
            guard let list = quarterList else {
                self?.displayError(errorMessage!)
                return
            }
            self?.dataModel = filterQuaterList(list : list)
        }
    }
    
    private func filterQuaterList(list: [QuarterData]) -> [YearDataCellModel]{
        var dataModel = [YearDataCellModel]()
        let yearList = 2004..<2018
        
        for i in yearList{
            let quarterList = list.filter{ $0.year == "\(i)" }
            if quarterList.count > 0 {
                dataModel.append(YearDataCellModel(quarterList: quarterList))
            }
        }
        return dataModel
    }
    
    private func configureTableDataSource() {
        for yearData in dataModel {
            tableDataSource.append(yearData)
        }
    }
    
    private func configureOutput() {
        numberOfRows = tableDataSource.count
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> YearDataCellModel {
        return tableDataSource[indexPath.row]
    }
}
