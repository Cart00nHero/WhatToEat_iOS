//
//  DropDownCellView.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/20.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class DropDownCellView: XibView {
    @IBOutlet weak var dropDownField: DropDown!
    lazy var superTableViewCell = UITableViewCell()
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        dropDownField.delegate = self
        dropDownField.didSelect{(selectedText , index ,id) in
            appStore.dispatch(
                CellDropDownMenuSelectedAction(dropdownView: self, selectedIndex: index, selectedText: selectedText)
            )
        }
    }
}

extension DropDownCellView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
}
