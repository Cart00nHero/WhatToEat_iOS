//
//  AddGourmetViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGourmetViewController: UIViewController {

    private var sceneVC: SceneViewController? = nil
    private var tableData = GourmetsTableData(address: initGQInputObject())
    private var originTableFooter = UIView()
    private let scenario = AddGourmetScenario()
    var saveToCreate = false
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scenario.beCollectGQInputPacel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
        sceneVC?.title = "Add"
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sceneVC?.registerKeyBoardNotification()
        originTableFooter = tableView.tableFooterView ?? UIView()
        scenario.beGetInputData { [self] (gqData) in
            tableData = GourmetsTableData(address: gqData)
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
                saveToCreate = gqData.branchId.isEmpty
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneVC?.stateDelegate = nil
    }
    
    private func updateTextFieldInputData(newText: String, indexPath: IndexPath) {
        scenario.beGetInputData { (inputObj) in
            var newInput = inputObj
            var newShop = newInput.shop
            DispatchQueue.main.async { [self] in
                if indexPath.section == 0 {
                    switch indexPath.row {
                    case 0:
                        newShop.title = newText
                    case 2:
                        newShop.underPrice = Float64(newText) ?? 0.0
                    default: break
                    }
                    newInput.shop = newShop
                    scenario.beUpdateInputData(newInput: newInput)
                    return
                }
                if indexPath.section == 1 {
                    var branch = inputObj.shopBranch
                    switch indexPath.row {
                    case 0:
                        branch.name = newText
                    case 2:
                        branch.tel = newText
                    default: break
                    }
                    newInput.shopBranch = branch
                    scenario.beUpdateInputData(newInput: newInput)
                    return
                }
            }
        }
    }
}

extension AddGourmetViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor =
            UIColor(red: 255.0/255.0, green: 77.0/255.0, blue: 64.0/255.0, alpha: 1.0)
        textLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        textLabel.text = tableData.sectionTitles[section]
        headerView.addSubview(textLabel)
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[textLabel]-5-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = tableData.dataSource[indexPath.section][indexPath.row]
        var cellIdentifier = "AddGTableViewCell"
        if data.templateStyle == .Button {
            cellIdentifier = "AddBtnTableViewCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "AddGTableViewCell" {
            let contentCell = cell as? AddGmtTableViewCell
            contentCell?.cellTemplate = data as? LRTemplate
        }
        if cellIdentifier == "AddBtnTableViewCell" {
            let contentCell = cell as? AddBtnTableViewCell
            contentCell?.cellData = data as? ButtonTemplate
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = tableData.dataSource[indexPath.section][indexPath.row]
        return data.itemHeight
    }
    
}
extension AddGourmetViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // let header scroll with table
        let sectionHeaderHeight: CGFloat = 36
        if scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: CGFloat(-scrollView.contentOffset.y), left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: CGFloat(-sectionHeaderHeight), left: 0, bottom: 0, right: 0)
        }
    }
}
extension AddGourmetViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case let action as AdjustForKeyboardAction:
            let notification = action.notification
            guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            let keyboardScreenEndFrame = keyboardValue.cgRectValue
            //        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
            if notification.name == UIResponder.keyboardWillHideNotification {
                tableView.tableFooterView = nil
                tableView.setContentOffset(.zero, animated: true)
            } else {
                let keyboardFooterView = UIView()
                keyboardFooterView.frame = CGRect(x: 0,y: 0,width: tableView.bounds.width,height: keyboardScreenEndFrame.height)
                tableView.tableFooterView = keyboardFooterView
            }
        case let action as CellDropDownMenuSelectedAction:
            let cell = action.dropdownView.superTableViewCell as? LRTableViewCell
            let indexPath = tableView.indexPath(for: cell!)
            var cellData = tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] as? LRTemplate
            let superTag = action.dropdownView.superview?.tag ?? 0
            scenario.beGetInputData { (inputObj) in
                var newInput = inputObj
                var newShop = newInput.shop
                DispatchQueue.main.async { [self] in
                    if LRTableViewCell.ContentSide(rawValue: superTag) ==
                        LRTableViewCell.ContentSide.Left {
                        var data = cellData?.leftViewItem as? DropDownItem
                        data?.selectedText = action.selectedText
                        newShop.style = data?.selectedText
                        cellData?.leftViewItem = data!
                        tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] = cellData!
                    } else {
                        var data = cellData?.rightViewItem as? DropDownItem
                        data?.selectedText = action.selectedText
                        newShop.type = data?.selectedText
                        cellData?.rightViewItem = data!
                        tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] = cellData!
                    }
                    newInput.shop = newShop
                    scenario.beUpdateInputData(newInput: newInput)
                }
            }
            
        case let action as CellTextFieldDidChangedAction:
            let cell = action.cell as? LRTableViewCell
            let indexPath = tableView.indexPath(for: cell!)
            tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0]
                = (cell?.cellTemplate)!
            let data = cell?.cellTemplate?.rightViewItem as? TextFieldItem
            updateTextFieldInputData(
                newText: data?.text ?? "", indexPath: indexPath!)
        case is TableCellButtonClickAction:
            scenario.beGetInputData { [self] (inputObj) in
                if saveToCreate {
                    appStore.dispatch(createGourmetAction(foodieId: globalFoodieId, inputObj: inputObj))
                } else {
                    appStore.dispatch(updateGourmetAction(foodieId: globalFoodieId, inputObj: inputObj))
                }
            }
        case let action as CreateGourmetAction:
            switch action.status {
            case .Success:
                let stackVCs = self.navigationController?.viewControllers
                self.navigationController?.popToViewController((stackVCs?[2])!, animated: true)
            default: break
            }
        case let action as UpdateGourmetAction:
            switch action.status {
            case .Success:
                let stackVCs = self.navigationController?.viewControllers
                self.navigationController?.popToViewController((stackVCs?[2])!, animated: true)
            default: break
            }
        default: break
        }
    }
}
