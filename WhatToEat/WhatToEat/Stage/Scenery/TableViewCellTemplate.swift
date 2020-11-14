//
//  TableViewCellTemplate.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/10.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class LRTableViewCell: UITableViewCell {
    
    enum ContentSide : Int {
        case Left,Right
    }
    @IBOutlet weak var cellLeftView: UIView!
    @IBOutlet weak var cellRightView: UIView!
    @IBOutlet weak var leftWidthConstraint: NSLayoutConstraint!
    
    var indexPath : IndexPath? = nil
    var cellTemplate: LRCellTemplate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    func buildCellContent(content: UIView, contentSide: ContentSide) {
        content.translatesAutoresizingMaskIntoConstraints = false
        var parentView : UIView? = nil
        switch contentSide {
        case .Left:
            parentView = cellLeftView
        case .Right:
            parentView = cellRightView
        }
        parentView?.addSubview(content)
        parentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[content]-|", options: [], metrics: nil, views: ["content": content]))
        parentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[content]-|", options: [], metrics: nil, views: ["content": content]))
    }
//    func createTextLabelOnCell(contentSide: ContentSide) -> UILabel {
//        let textLabel = UILabel()
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        var contentView : UIView? = nil
//        switch contentSide {
//        case .Left:
//            contentView = cellLeftView
//        case .Right:
//            contentView = cellRightView
//        }
//        contentView?.addSubview(textLabel)
//        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
//        contentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textLabel]-|", options: [], metrics: nil, views: ["textLabel": textLabel]))
//        if cellRightView.subviews.count == 0 {
//        }
//        return textLabel
//    }
}

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    var cellData: ButtonCellTmplt?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
