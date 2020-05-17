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
    private let tableData = GourmetsTableData()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appStore.dispatch(RegisterStateAction(subscriber: String(describing: type(of: self))))
        registerKeyBoardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.defaultTemplate?.stateDelegate = nil
    }
    private func registerKeyBoardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
        } else {
            var contentInsets:UIEdgeInsets

            if UIDevice.current.orientation == .portrait {

                contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardScreenEndFrame.height, right: 0.0);
            }
            else {
                contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardScreenEndFrame.width, right: 0.0)
            }

            tableView.contentInset = contentInsets

//            tableView.scrollToRowAtIndexPath(editingIndexPath, atScrollPosition: .Top, animated: true)
            tableView.scrollIndicatorInsets = tableView.contentInset
        }
    }
    // MARK: - Actions

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
        textLabel.font = UIFont.systemFont(ofSize: 13.0)
        textLabel.text = tableData.sectionTitles[section]
        headerView.addSubview(textLabel)
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[textLabel]-5-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = tableData.dataSource[indexPath.section][indexPath.row]
        var cellIdentifier = "AddGLRTableViewCell"
        if data.templateStyle == .Button {
            cellIdentifier = "ButtonCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "AddGLRTableViewCell" {
            let contentCell = cell as? AddGLRTableViewCell
            contentCell?.cellData = data as? LRCellData
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
    }
}
