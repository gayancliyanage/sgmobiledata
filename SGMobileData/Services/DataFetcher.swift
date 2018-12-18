//
//  DataFetcher.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import Foundation

protocol MobileDataFetcherProtocol {
    func fetchQuarterList(completion: ([QuarterData]?,_ errorMessage: String?)->())
}



