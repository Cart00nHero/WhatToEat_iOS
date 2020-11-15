//
//  AddGourmetViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGourmetViewController: UIViewController {

    private var defaultTemplate: DefaultVCTemplate? = nil
    private var tableData = GourmetsTableData(address: initGQInputObject())
    private var originTableFooter = UIView()
    let presenter = AddGourmetPresenter()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaultTemplate?.registerKeyBoardNotification()
        originTableFooter = tableView.tableFooterView ?? UIView()
        appStore.dispatch(ReceivedParcelAction())
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.defaultTemplate?.stateDelegate = nil
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
        textLabel.textColor = UIColor(red: 255.0/255.0, green: 0.0, blue: 0.0, alpha: 1.0)
        textLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
//        textLabel.font = UIFont.systemFont(ofSize: 18.0)
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
            let contentCell = cell as? AddGTableViewCell
            contentCell?.cellTemplate = data as? LRCellTemplate
        }
        if cellIdentifier == "AddBtnTableViewCell" {
            let contentCell = cell as? AddBtnTableViewCell
            contentCell?.cellData = data as? BtnCellTemplate
        }
        return cell
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
extension AddGourmetViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        if state.receivedParcel?.recipient == String(describing: type(of: self)) {
            if state.receivedParcel?.parcelType == "MKAnnotationDidSelectAction" {
                let parcelAction = state.receivedParcel?.parcel as! MKAnnotationDidSelectAction
                let gqAddress = parcelAction.selectedLoc
                presenter.newLoc = gqAddress!
                if presenter.newLoc.address.fullInfo.isEmpty {
                    // To-Do: Here Upload to Insert
                    presenter.saveToUpload = false
                    presenter.newLoc.address.completeInfo = combineAddressCompleteInfo(input: gqAddress!)
                }else {
                    presenter.saveToUpload = true
                }
                tableData = GourmetsTableData(address: presenter.newLoc)
                tableView.reloadData()
                appStore.dispatch(SignParcelReceiptAction(recipient: String(describing: type(of: self))))
            }
        }
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
            var cellData = tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] as? LRCellTemplate
            let superTag = action.dropdownView.superview?.tag ?? 0
            var newShop = presenter.newLoc.shop
            if LRTableViewCell.ContentSide(rawValue: superTag) ==
                LRTableViewCell.ContentSide.Left {
                var data = cellData?.leftProtocol as? DropDownCell
                data?.selectedText = action.selectedText
                newShop.style = data?.selectedText
                cellData?.leftProtocol = data!
                tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] = cellData!
            } else {
                var data = cellData?.rightProtocol as? DropDownCell
                data?.selectedText = action.selectedText
                newShop.type = data?.selectedText
                cellData?.rightProtocol = data!
                tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] = cellData!
            }
        case let action as RangeDatePickerSelectedAction:
            var branch = presenter.newLoc.shopBranch
            branch.openTime = convertDateToUTC_ISO8601DateString(date: action.startDate )
            branch.closedTime = convertDateToUTC_ISO8601DateString(date: action.endDate )
            presenter.newLoc.shopBranch = branch
            
            let cell = action.rangeView.superTableViewCell as? LRTableViewCell
            let indexPath = tableView.indexPath(for: cell!)
            var cellData = tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] as? LRCellTemplate
            var data = cellData?.rightProtocol as? RangeCell
            data?.starDate =
                convertStringToUTC_ISO8601Date(dateString: branch.openTime! ?? "")
            data?.endDate =
                convertStringToUTC_ISO8601Date(dateString: branch.closedTime! ?? "")
            cellData?.rightProtocol = data!
            tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0] = cellData!
            
        case let action as CellTextFieldDidChangedAction:
            let cell = action.cell as? LRTableViewCell
            let indexPath = tableView.indexPath(for: cell!)
            tableData.dataSource[indexPath?.section ?? 0][indexPath?.row ?? 0]
                = (cell?.cellTemplate)!
            let data = cell?.cellTemplate?.rightProtocol as? TextFieldCell
            presenter.updateTextFieldInputData(newText: data?.text ?? "", indexPath: indexPath!)
        case is TableCellButtonClickAction:
            if presenter.saveToUpload {
                appStore.dispatch(updateGroumetAction(inputObj: presenter.newLoc))
            } else {
                presenter.newLoc.address.fullInfo = combineFullInfo(input: presenter.newLoc)
                appStore.dispatch(createGourmetAction(foodieId: nil, inputObj: presenter.newLoc))
            }
        case let action as CreateGourmetAction:
            switch action.status {
            case .Success:
                let stackVCs = self.navigationController?.viewControllers
                self.navigationController?.popToViewController((stackVCs?[2])!, animated: true)
            default: break
            }
        case let action as UpdateGroumetAction:
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
