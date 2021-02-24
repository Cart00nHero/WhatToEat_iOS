//
//  FindFoodTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/19.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class DetailLRTableViewCell: LRTableViewCell {
    
    @IBOutlet weak var cellLeftLabel: UILabel!
    private var leftContentView: UIView? = nil
    private var rightContentView: UIView? = nil
    private var mkCircle: MKCircle? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    override func layoutSubviews() {
        super.layoutSubviews()
        createLeftView()
        createRightView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func createLeftView() {
        if cellTemplate?.leftViewItem != nil {
            let data = cellTemplate!.leftViewItem as? LabelItem
            cellLeftLabel.text = data?.text
        }
    }
    
    private func createRightView() {
        if cellTemplate?.rightViewItem != nil {
            let textLabel = UILabel()
            buildConstraints(content: textLabel, side: .Right)
            let data = cellTemplate!.rightViewItem as? LabelItem
            textLabel.textColor = UIColor(red: 112.0/255.0, green: 66.0/255.0, blue: 20.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.text
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping
        }
    }
    
}

// MARK: - FindFoodBtnTableViewCell

class DetailBtnTableViewCell: ButtonTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        cellButton.isHidden = cellData?.isHidden ?? false
        cellButton.setTitle(cellData?.titleText, for: .normal)
        cellButton.layer.cornerRadius = cellData?.cornerRadius ?? 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
