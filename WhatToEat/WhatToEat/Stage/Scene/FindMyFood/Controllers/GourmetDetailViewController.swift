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
    
    @IBOutlet weak var dislikeButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /* 暫時沒有要用
        if let image = UIImage(named: "image_throw_trash") {
            let smallImage = resizeImage(image: image, width: 44)
            dislikeButton.image = smallImage.withRenderingMode(.alwaysOriginal)

        }*/
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scenario.beCollectParcel { [self] (data) in
            tableData.reloadData(data: data)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func dislikeButtonClickAction(sender: UIBarButtonItem) {
        appStore.dispatch(
            dislikeGourmetAction(
                foodieId: globalFoodieId,
                branchId: tableData.dataObj.shopBranch?.uniqueId ?? ""))
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
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "DetailLRTableViewCell",
                for: indexPath) as! DetailLRTableViewCell
        cell.cellTemplate = data as? LRTemplate
        return cell
    }
}
