//
//  YearDataTableViewCell.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import UIKit

class YearDataTableViewCell: UITableViewCell {

    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model: YearDataCellModel) {
        yearLabel.text = model.year
        dataLabel.text = "\(model.data!)"
    }

}
