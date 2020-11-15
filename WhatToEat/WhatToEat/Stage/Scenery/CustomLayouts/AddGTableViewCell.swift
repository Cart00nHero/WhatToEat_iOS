//
//  AddGLRTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/17.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGTableViewCell: LRTableViewCell {

    @IBOutlet weak var cellLeftLabel: UILabel!
    private var leftContent: UIView? = nil
    private var rightContent: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createLeft()
        createRight()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    // MARK: - build content
    private func createLeft() {
        let type = cellTemplate?.leftProtocol.contentType
        if type != .TextLabel {
            for subView in cellLeftView.subviews {
                subView.removeFromSuperview()
            }
        }
        switch type {
        case .TextLabel:
            putLeftTitleTextOnLabel(cellProtocol: cellTemplate!.leftProtocol)
        case .DropDown:
            let dropDownView = DropDownCellView()
            buildConstraints(content: dropDownView, side: .Left)
            let data = cellTemplate!.leftProtocol as? DropDownCell
            dropDownView.superTableViewCell = self
            dropDownView.dropDownField.placeholder = data?.placeHolder
            dropDownView.dropDownField.optionArray = data?.optionArray ?? []
            dropDownView.dropDownField.text = data?.selectedText
            leftWidthConstraint.constant = self.contentView.frame.width/2.0
        default: break
        }
    }
    private func createRight() {
        switch cellTemplate?.rightProtocol.contentType {
        case .TextField:
            let textField = UITextField()
            buildConstraints(content: textField, side: .Right)
            let data = cellTemplate!.rightProtocol as? TextFieldCell
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(red: 240.0/255.0, green: 248.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            textField.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
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
        case .TextLabel:
            let textLabel = UILabel()
            buildConstraints(content: textLabel, side: .Right)
            let data = cellTemplate!.rightProtocol as? LabelCell
            textLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.text
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping
        case .DropDown:
            let dropDownView = DropDownCellView()
            buildConstraints(content: dropDownView, side: .Right)
            let data = cellTemplate!.rightProtocol as? DropDownCell
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
    
    private func putLeftTitleTextOnLabel(cellProtocol: CellProtocol) {
        let data = cellProtocol as? LabelCell
        cellLeftLabel.text = data?.text
    }
    
    // MARK: - UI Actions
    @objc private func textFieldDidChanged(sender: UITextField) {
        let superViewTag = ContentSide(rawValue: sender.superview?.tag ?? 0)
        if superViewTag == ContentSide.Right {
            var data = cellTemplate?.rightProtocol as? TextFieldCell
            data?.text = sender.text ?? ""
            cellTemplate?.rightProtocol = data ?? TextFieldCell()
        } else {
            var data = cellTemplate?.leftProtocol as? TextFieldCell
            data?.text = sender.text ?? ""
            cellTemplate?.leftProtocol = data ?? TextFieldCell()
        }
        appStore.dispatch(CellTextFieldDidChangedAction(cell: self, textField: sender))
    }

}
extension AddGTableViewCell: UITextFieldDelegate {
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
        return count <= 10
    }
}
