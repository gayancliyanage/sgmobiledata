//
//  DataFetcher.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import Foundation
import Alamofire

protocol MobileDataFetcherProtocol {
    func fetchQuarterList(completion: @escaping ([QuarterData]?,_ errorMessage: String?)->())
}

class MobileDataFetcher : MobileDataFetcherProtocol {
    func fetchQuarterList(completion: @escaping ([QuarterData]?, String?) -> ()) {
        
        Alamofire.request("https://data.gov.sg/api/action/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f").responseJSON { response in
                switch response.result {
                case .success:
                    if let json = response.result.value as? [String : Any] {
                        let result =  json["result"] as! [String : Any]
                        let quaterData = result["records"] as! [[String: Any]]
                        completion(self.quarterListFrom(resutls: quaterData),nil)
                    }
                case .failure(let error):
                   completion(nil, "There is a problem in fetching places for you. \(error)")
                }
        }
    }
    
    private func quarterListFrom(resutls: [[String: Any]]) -> [QuarterData]{
        var quarterList = [QuarterData]()
        for item in resutls{
            let quaterItem = QuarterData(attributes: item)
            quarterList.append(quaterItem)
        }
        return quarterList
    }
    
}


