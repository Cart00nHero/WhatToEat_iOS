//
//  AddGmtTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/17.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGmtTableViewCell: LRTableViewCell {
    
    @IBOutlet weak var cellLeftLabel: UILabel!
    private var leftContent: UIView? = nil
    private var rightContent: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if leftContent != nil {
            leftContent?.removeFromSuperview()
        }
        for subView in cellRightView.subviews {
            subView.removeFromSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createLeft()
        createRight()
    }
    
    // MARK: - build content
    private func createLeft() {
        let type = cellTemplate?.leftViewItem.viewType
        if type != .Label {
            for subView in cellLeftView.subviews {
                subView.removeFromSuperview()
            }
        }
        switch type {
        case .Label:
            putLeftTitleTextOnLabel(cellProtocol: cellTemplate!.leftViewItem)
        case .DropDown:
            let dropDownView = DropDownCellView()
            buildConstraints(content: dropDownView, side: .Left)
            let data = cellTemplate!.leftViewItem as? DropDownItem
            dropDownView.superTableViewCell = self
            dropDownView.dropDownField.placeholder = data?.placeHolder
            dropDownView.dropDownField.optionArray = data?.optionArray ?? []
            dropDownView.dropDownField.text = data?.selectedText
            leftWidthConstraint.constant = self.contentView.frame.width/2.0
        default: break
        }
    }
    private func createRight() {
        switch cellTemplate?.rightViewItem.viewType {
        case .TextField:
            let textField = UITextField()
            buildConstraints(content: textField, side: .Right)
            let data = cellTemplate!.rightViewItem as? TextFieldItem
            textField.borderStyle = .roundedRect
            textField.backgroundColor =
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 240.0/255.0, alpha: 1.0)
            textField.textColor =
                UIColor(red: 112.0/255.0, green: 60.0/255.0, blue: 20.0/255.0, alpha: 1.0)
            textField.keyboardType = data?.keyboardType ?? UIKeyboardType.default
            textField.returnKeyType = .done
            textField.clearButtonMode = .whileEditing
            textField.delegate = self
            if data?.text.isEmpty == false {
                textField.text = data?.text
            } else {
                textField.placeholder = data?.placeHolder
            }
            textField.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
        case .Label:
            let textLabel = UILabel()
            buildConstraints(content: textLabel, side: .Right)
            let data = cellTemplate!.rightViewItem as? LabelItem
            textLabel.textColor = UIColor(red: 112.0/255.0, green: 60.0/255.0, blue: 20.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.text
            textLabel.numberOfLines = data?.numberOfLines ?? 0
            textLabel.lineBreakMode = .byWordWrapping
        case .DropDown:
            let dropDownView = DropDownCellView()
            buildConstraints(content: dropDownView, side: .Right)
            let data = cellTemplate!.rightViewItem as? DropDownItem
            dropDownView.superTableViewCell = self
            dropDownView.dropDownField.placeholder = data?.placeHolder
            dropDownView.dropDownField.optionArray = data?.optionArray ?? []
            dropDownView.dropDownField.text = data?.selectedText
            leftWidthConstraint.constant = self.contentView.frame.width/2.0
        case .Range:
            let rangeView = SetRangeCellView()
            rangeView.superTableViewCell = self
            buildConstraints(content: rangeView, side: .Right)
        default: break
        }
    }
    
    private func putLeftTitleTextOnLabel(cellProtocol: ViewItemProtocol) {
        let data = cellProtocol as? LabelItem
        cellLeftLabel.text = data?.text
    }
    
    // MARK: - UI Actions
    @objc private func textFieldDidChanged(sender: UITextField) {
        let superViewTag = ContentSide(rawValue: sender.superview?.tag ?? 0)
        if superViewTag == ContentSide.Right {
            var data = cellTemplate?.rightViewItem as? TextFieldItem
            data?.text = sender.text ?? ""
            cellTemplate?.rightViewItem = data ?? TextFieldItem()
        } else {
            var data = cellTemplate?.leftViewItem as? TextFieldItem
            data?.text = sender.text ?? ""
            cellTemplate?.leftViewItem = data ?? TextFieldItem()
        }
        appStore.dispatch(CellTextFieldDidChangedAction(cell: self, textField: sender))
    }
    
}
extension AddGmtTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 20
    }
}
