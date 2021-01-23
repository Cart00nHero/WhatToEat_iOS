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
    var cellTemplate: LRTemplate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func buildConstraints(content: UIView, side: ContentSide) {
        content.translatesAutoresizingMaskIntoConstraints = false
        var parentView : UIView? = nil
        switch side {
        case .Left:
            parentView = cellLeftView
        case .Right:
            parentView = cellRightView
        }
        parentView?.addSubview(content)
        parentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[content]-|", options: [], metrics: nil, views: ["content": content]))
        parentView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[content]-|", options: [], metrics: nil, views: ["content": content]))
    }
}

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellButton: UIButton!
    var cellData: ButtonTemplate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func cellButtonClickAction(sender: UIButton) {
        appStore.dispatch(TableCellButtonClickAction(cell: self, button: sender))
    }
}
