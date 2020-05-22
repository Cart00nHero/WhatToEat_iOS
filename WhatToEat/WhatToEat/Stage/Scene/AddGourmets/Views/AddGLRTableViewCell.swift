//
//  AddGLRTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/17.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGLRTableViewCell: LRTableViewCell {

    private enum ContentSide : Int {
        case Left,Right
    }
    @IBOutlet weak var cellLeftLabel: UILabel!
    
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
        for subView in cellLeftView.subviews {
            subView.removeFromSuperview()
        }
        for subView in cellRightView.subviews {
            subView.removeFromSuperview()
        }
    }
    
    // MARK: - create view
    private func createLeftView() {
        switch cellData?.leftCellProtocol.cellStyle {
        case .TextLabel:
//            createTextLabelOnCell(cellProtocol: cellData!.leftCellProtocol, contentSide: .Left)
            putLeftTitleTextOnLabel(cellProtocol: cellData!.leftCellProtocol)
        default: break
        }
    }
    private func createRightView() {
        switch cellData?.rightCellProtocol.cellStyle {
        case .TextField:
            createRTextFieldOnCell(cellProtocol: cellData!.rightCellProtocol)
        default: break
        }
    }
    
    private func createDropDownCellView(cellProtocol: LRTableCellProtocol, contentSide: ContentSide) {
        
        let dropDownView = DropDownCellView()
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        var contentView = UIView()
        switch contentSide {
            
        case .Left:
            for subView in cellLeftView.subviews {
                subView.removeFromSuperview()
            }
            contentView = cellLeftView
        case .Right:
            contentView = cellRightView
        }
        contentView.addSubview(dropDownView)
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[dropDownView]-|", options: [], metrics: nil, views: ["dropDownView": dropDownView]))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[dropDownView]-|", options: [], metrics: nil, views: ["dropDownView": dropDownView]))
    }
    // MARK: - left style
    private func putLeftTitleTextOnLabel(cellProtocol: LRTableCellProtocol) {
        let data = cellProtocol as? LRTextLabelCell
        cellLeftLabel.text = data?.labelText
    }
    // MARK: - right style
    private func createTextLabelOnCell(cellProtocol: LRTableCellProtocol, contentSide: ContentSide) {
        if cellRightView.subviews.count == 0 {
            let data = cellProtocol as? LRTextLabelCell
            let textLabel = UILabel()
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.labelText
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping
            textLabel.backgroundColor = UIColor.red
            var contentView = UIView()
            switch contentSide {
                
            case .Left:
                contentView = cellLeftView
            case .Right:
                contentView = cellRightView
            }
            contentView.addSubview(textLabel)
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[textLabel]-10-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
        }
    }
    
    private func createRTextFieldOnCell(cellProtocol: LRTableCellProtocol) {
        if cellRightView.subviews.count == 0 {
            let data = cellProtocol as? LRTextFieldCell
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.borderStyle = .roundedRect
            textField.keyboardType = data?.keyboardType ?? UIKeyboardType.default
            if data?.inputText.isEmpty == false {
                textField.text = data?.inputText
            } else {
                textField.placeholder = data?.placeHolder
            }
            cellRightView.addSubview(textField)
            cellRightView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textField]-|", options: [], metrics: nil, views: ["textField": textField]))
            cellRightView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textField]-|", options: [], metrics: nil, views: ["textField": textField]))
        }
    }


}
