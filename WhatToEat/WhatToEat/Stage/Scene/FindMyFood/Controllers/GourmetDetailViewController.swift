//
//  GourmetDetailViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/23.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import UIKit

class GourmetDetailViewController: UIViewController {
    
    private var scenario = GourmetDetailScenario()
    private var tableData = DetailTableData(dataObj: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery())
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scenario.beCollectParcel { [self] (data) in
            tableData.reloadData(data: data)
            DispatchQueue.main.async {
//                tableView.reloadData()
            }
        }
    }
    
}

extension GourmetDetailViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = tableData.dataSource[indexPath.row]
        var cellIdentifier = "FindFoodTableViewCell"
        switch data.templateStyle {
        case .Button:
            cellIdentifier = "FFBtnTableViewCell"
        default: break
        }
        let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "FindFoodTableViewCell" {
            let contentCell = cell as! FindFoodTableViewCell
            contentCell.cellTemplate = data as? LRTemplate
        }else {
            let contentCell = cell as! FFBtnTableViewCell
            contentCell.cellData = data as? ButtonTemplate
        }
        return cell
    }
}
