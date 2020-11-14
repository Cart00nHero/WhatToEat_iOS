//
//  AddGLRTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/17.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGLRTableViewCell: LRTableViewCell {

    @IBOutlet weak var cellLeftLabel: UILabel!
    private var leftContentView: UIView? = nil
    private var rightContentView: UIView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        createLeftView()
        createRightView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        if leftContentView != nil {
            leftContentView?.removeFromSuperview()
        }
        for subView in cellRightView.subviews {
            subView.removeFromSuperview()
        }
    }
    // MARK: - UI Actions
    @objc private func textFieldDidChanged(sender: UITextField) {
        let superViewTag = ContentSide(rawValue: sender.superview?.tag ?? 0)
        if superViewTag == ContentSide.Right {
            var data = cellTemplate?.rightCellProtocol as? TextFieldCell
            data?.inputText = sender.text ?? ""
            cellTemplate?.rightCellProtocol = data ?? TextFieldCell()
        } else {
            var data = cellTemplate?.leftCellProtocol as? TextFieldCell
            data?.inputText = sender.text ?? ""
            cellTemplate?.leftCellProtocol = data ?? TextFieldCell()
        }
        appStore.dispatch(CellTextFieldDidChangedAction(cell: self, textField: sender))
    }
    // MARK: - create view
    private func createLeftView() {
        let style = cellTemplate?.leftCellProtocol.cellStyle
        if style != .TextLabel {
            for subView in cellLeftView.subviews {
                subView.removeFromSuperview()
            }
        }
        switch style {
        case .TextLabel:
            putLeftTitleTextOnLabel(cellProtocol: cellTemplate!.leftCellProtocol)
        case .DropDown:
            leftWidthConstraint.constant = self.contentView.frame.width/2.0
            createDropDownMenuOnCell(cellProtocol: cellTemplate!.leftCellProtocol, contentSide: .Left)
        default: break
        }
    }
    private func createRightView() {
        switch cellTemplate?.rightCellProtocol.cellStyle {
        case .TextField:
            createTextFieldOnCell(cellProtocol: cellTemplate!.rightCellProtocol, contentSide: .Right)
        case .TextLabel:
            createTextLabelOnCell(cellProtocol: cellTemplate!.rightCellProtocol, contentSide: .Right)
        case .DropDown:
            createDropDownMenuOnCell(cellProtocol: cellTemplate!.rightCellProtocol, contentSide: .Right)
        case .Range:
            createRangeViewOnCell(cellProtocol: cellTemplate!.rightCellProtocol, contentSide: .Right)
        default: break
        }
    }
    
    private func createRangeViewOnCell(cellProtocol: CellProtocol, contentSide: ContentSide){
        let rangeView = SetRangeCellView()
        rangeView.superTableViewCell = self
        rangeView.translatesAutoresizingMaskIntoConstraints = false
        var contentView : UIView? = nil
        switch contentSide {
        case .Left:
            leftContentView = rangeView
            contentView = cellLeftView
        case .Right:
            contentView = cellRightView
        }
        contentView?.addSubview(rangeView)
        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[rangeView]-|", options: [], metrics: nil, views: ["rangeView": rangeView]))
        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[rangeView]-|", options: [], metrics: nil, views: ["rangeView": rangeView]))
        
    }
    private func createDropDownMenuOnCell(cellProtocol: CellProtocol, contentSide: ContentSide) {
        let dropDownView = DropDownCellView()
        dropDownView.superTableViewCell = self
        let data = cellProtocol as? DropDownCell
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.dropDownField.placeholder = data?.placeHolder
        dropDownView.dropDownField.optionArray = data?.optionArray ?? []
        dropDownView.dropDownField.text = data?.selectedText
        var contentView : UIView? = nil
        switch contentSide {
        case .Left:
            leftContentView = dropDownView
            contentView = cellLeftView
        case .Right:
            contentView = cellRightView
        }
        contentView?.addSubview(dropDownView)
        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[dropDownView]-|", options: [], metrics: nil, views: ["dropDownView": dropDownView]))
        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[dropDownView]-|", options: [], metrics: nil, views: ["dropDownView": dropDownView]))
    }
    
    func ceateAddressInputView(cellProtocol: CellProtocol, contentSide: ContentSide) {
//        let addressView = AddressInputCellView()
//        addressView.superTableViewCell = self
        
    }
    
    private func putLeftTitleTextOnLabel(cellProtocol: CellProtocol) {
        let data = cellProtocol as? LabelCell
        cellLeftLabel.text = data?.labelText
    }
    private func createTextLabelOnCell(cellProtocol: CellProtocol, contentSide: ContentSide) {
        if cellRightView.subviews.count == 0 {
            let data = cellProtocol as? LabelCell
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.labelText
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping
            var contentView : UIView? = nil
            switch contentSide {
            case .Left:
                contentView = cellLeftView
            case .Right:
                contentView = cellRightView
            }
            contentView?.addSubview(textLabel)
            contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
            contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        }
    }
    
    private func createTextFieldOnCell(cellProtocol: CellProtocol, contentSide: ContentSide) {
        if cellRightView.subviews.count == 0 {
            let data = cellProtocol as? TextFieldCell
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(red: 240.0/255.0, green: 248.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            textField.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            textField.keyboardType = data?.keyboardType ?? UIKeyboardType.default
            textField.returnKeyType = .done
            textField.clearButtonMode = .whileEditing
            textField.delegate = self
            if data?.inputText.isEmpty == false {
                textField.text = data?.inputText
            } else {
                textField.placeholder = data?.placeHolder
            }
            var contentView : UIView? = nil
            switch contentSide {
            case .Left:
                contentView = cellLeftView
            case .Right:
                contentView = cellRightView
            }
            contentView?.addSubview(textField)
            contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textField]-|", options: [], metrics: nil, views: ["textField": textField]))
            contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textField]-|", options: [], metrics: nil, views: ["textField": textField]))
            textField.addTarget(self, action: #selector(textFieldDidChanged(sender:)), for: .editingChanged)
        }
    }

}
extension AddGLRTableViewCell: UITextFieldDelegate {
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
