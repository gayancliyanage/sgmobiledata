//
//  File.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import Foundation

struct YearDataCellModel: Equatable  {
    var year: String?
    var data: Double?
    var isDesc: Bool?
    
    init(quarterList: [QuarterData]){
        self.year = quarterList.first!.year!
        self.data = calculateYearData(quarterList: quarterList)
        self.isDesc = isDescending(quarterList: quarterList)
    }
    
    init(year: String, data: Double, isDesc: Bool ){
        self.year = year
        self.data = data
        self.isDesc = isDesc
    }
    
    private func calculateYearData(quarterList:[QuarterData]) -> Double {
        var data : Double = 0.0
        for quarter in quarterList {
            data += quarter.data!
        }
        
        return data/Double(quarterList.count)
    }
    
    private func isDescending(quarterList:[QuarterData]) -> Bool {
        var temp  = quarterList as [QuarterData]
        temp = temp.sorted(by: { $0.quarter! > $1.quarter! })
        for i in 1..<quarterList.count {
            if temp[i-1].data! > temp[i].data! {
                return false
            }
        }
        return true
    }
}
