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
