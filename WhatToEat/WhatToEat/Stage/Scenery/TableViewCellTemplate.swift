//
//  TableViewCellTemplate.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/10.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

enum CellTemplateStyle : Int {
    case LeftRight,Button
}
protocol CellDataProtocol {
    var templateStyle: CellTemplateStyle { get }
}

class LRTableViewCell: UITableViewCell {

    enum ContentSide : Int {
        case Left,Right
    }
    @IBOutlet weak var cellLeftView: UIView!
    @IBOutlet weak var cellRightView: UIView!
    @IBOutlet weak var leftWidthConstraint: NSLayoutConstraint!
    
    var indexPath : IndexPath? = nil
    var cellData: LRCellData?
    
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
        self.accessoryType = .none
    }
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var cellButton: UIButton!
    var cellData: ButtonCellData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
