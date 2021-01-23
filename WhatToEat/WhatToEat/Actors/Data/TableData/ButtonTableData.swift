//
//  ButtonTableData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct BtnCellTemplate: TemplateProtocol {
    let templateStyle: TemplateStyle = .Button
    var cornerRadius: CGFloat = 0.0
    var titleText = ""
    var isHidden = false
    var itemHeight: CGFloat = 48.0
}
