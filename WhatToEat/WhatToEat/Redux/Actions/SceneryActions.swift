//
//  SceneryActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

struct TableCellButtonClickAction: Action {
    let cell: UITableViewCell
    let button: UIButton
}

struct DropDownMenuSelectedAction: Action {
    let dropdownView: DropDownCellView
    let selectedIndex: Int
    let selectedText: String
}
