//
//  GourmetDetailViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/23.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class GourmetDetailViewController: UIViewController {
    
    private var scenario = GourmetDetailScenario()
    private var sceneVC: SceneViewController? = nil
    private var tableData = DetailTableData(dataObj: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery())
    
        @IBOutlet weak var updateButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
        if let image = UIImage(named: "icon_edit") {
            GourmetDetailScenario().beResizeUpdateButtonImage(origin: image) { [self] (smallImage) in
                self.updateButton.image = smallImage.withRenderingMode(.alwaysOriginal)
            }
        }
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
    
    @IBAction func updateButtonClickAction(sender: UIBarButtonItem) {
        scenario.bePackageUpdateData(data: tableData.dataObj) {
            self.dismiss(animated: true) {
                appStore.dispatch(GoAddGourmetScenarioAction())
            }
        }
    }
    private func callNumber(phoneNumber:String) {
      if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL as URL)) {
            application.open(phoneCallURL as URL, options: [:], completionHandler: nil)
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
        var cellIdentifier = "DetailLRTableViewCell"
        if data.templateStyle == .Button {
            cellIdentifier = "ButtonTableViewCell"
        }
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: cellIdentifier,
                for: indexPath)
        if cellIdentifier == "DetailLRTableViewCell" {
            (cell as! DetailLRTableViewCell).cellTemplate
                = data as? LRTemplate
        } else {
            let contentCell = cell as? ButtonTableViewCell
            contentCell?.cellData = data as? ButtonTemplate
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = tableData.dataSource[indexPath.row]
        if data.templateStyle == .LeftRight {
            let leftItem = (data as! LRTemplate).leftViewItem
            let titleText = (leftItem as! LabelItem).text
            
            if titleText == "Title" || titleText == "Subtitle" {
                scenario.beGoogleSearchTitle(data: tableData.dataObj) { (encodeUrl) in
                    let sfVC =
                        SFSafariViewController(url: URL(string: encodeUrl)!)
                    self.present(sfVC, animated: true, completion: nil)
                }
                return
            }
            if titleText == "Tel" {
                let rightItem = (data as! LRTemplate).rightViewItem
                callNumber(phoneNumber: (rightItem as! LabelItem).text)
            }
        }
    }
}

extension GourmetDetailViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case is TableCellButtonClickAction:
            let latitude = Double(tableData.dataObj.latitude!) ?? 0.0
            let longitude = Double(tableData.dataObj.longitude!) ?? 0.0
            scenario.bePackageLocation(
                latitude: latitude, longitude: longitude) {
                appStore.dispatch(GoGoogleNavigationAction())
                self.dismiss(animated: true, completion: nil)
            }
        default:break
        }
    }
}

