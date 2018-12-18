//
//  QuarterData.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 17/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import Foundation

struct QuarterData : Equatable {
    var year: String?
    var quarter: Int?
    var data: Double?
    
    init(attributes: [String: Any]){
        year = String((attributes["quarter"] as? String)!.prefix(4))
        quarter = Int(Double(String((attributes["quarter"] as? String)!.suffix(1)))!)
        data = Double((attributes["volume_of_mobile_data"] as? String)!)
    }
}
