//
//  YearDataTableViewController.swift
//  SGMobileData
//
//  Created by Gayan Liyanage on 18/12/18.
//  Copyright © 2018 Gayan Liyanage. All rights reserved.
//

import UIKit

class YearDataTableViewController: UITableViewController {

    let viewModel = YearDataListViewModel(dataFetcher: MobileDataFetcher())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        viewModel.viewDidLoad()
        
        viewModel.updateTableView = { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return viewModel.numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YearDataCell", for: indexPath) as! YearDataTableViewCell
        let cellDataModel = viewModel.tableCellDataModelForIndexPath(indexPath)
        cell.configureCell(model: cellDataModel)
        return cell
    }
    
}
