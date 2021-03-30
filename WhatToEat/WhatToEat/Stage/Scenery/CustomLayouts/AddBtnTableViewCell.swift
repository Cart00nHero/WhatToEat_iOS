//
//  AddBtnTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddBtnTableViewCell: ButtonTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        superview?.layoutSubviews()
        cellButton.setTitle(cellData?.titleText, for: .normal)
        cellButton.layer.cornerRadius = cellData?.cornerRadius ?? 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
