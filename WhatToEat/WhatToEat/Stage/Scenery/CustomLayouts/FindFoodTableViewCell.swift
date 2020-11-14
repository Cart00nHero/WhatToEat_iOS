//
//  FindFoodTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/19.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class FindFoodTableViewCell: LRTableViewCell {
    
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
        let data = cellTemplate!.leftProtocol as? LabelCell
        cellLeftLabel.text = data?.labelText
    }
    
    private func createRightView() {
        if rightContentView?.subviews.count == 0 {
            let textLabel = UILabel()
            buildCellContent(content: textLabel, contentSide: .Right)
            let data = cellTemplate!.rightProtocol as? LabelCell
            textLabel.textColor = UIColor(red: 74.0/255.0, green: 74.0/255.0, blue: 74.0/255.0, alpha: 1.0)
            textLabel.font = UIFont.systemFont(ofSize: 14.0)
            textLabel.text = data?.labelText
            textLabel.numberOfLines = 0
            textLabel.lineBreakMode = .byWordWrapping
        }
    }
    
}

// MARK: - FindFoodBtnTableViewCell

class FFBtnTableViewCell: ButtonTableViewCell {

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
    
    @IBAction func cellButtonClickAction(sender: UIButton) {
        appStore.dispatch(TableCellButtonClickAction(cell: self, button: sender))
    }
}
