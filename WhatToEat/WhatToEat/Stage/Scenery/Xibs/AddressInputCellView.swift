//
//  AddressInputCellView.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/6.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddressInputCellView: XibView {

    lazy var superTableViewCell = UITableViewCell()
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet var floorTextFields: [UITextField]!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

}
