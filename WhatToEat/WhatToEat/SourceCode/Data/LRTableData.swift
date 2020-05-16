//
//  LRTableData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/11.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

enum LRCellStyle : Int {
    case TextLabel,TextField
}

struct LRTextLabelCell: LRTableCellProtocol {
    var cellStyle: LRCellStyle
    var cellHeight: CGFloat = 48.0
    var labelText = ""
}

struct LRTextFieldCell: LRTableCellProtocol {
    var cellStyle: LRCellStyle
    var cellHeight: CGFloat = 48.0
    var placeHolder = ""
    var inputText = ""
}

protocol LRTableCellProtocol {
    var cellStyle: LRCellStyle { get set }
    var cellHeight: CGFloat { get set }
}

struct LRCellData: CellDataProtocol {
    var templateStyle: CellTemplateStyle
    var leftCellProtocol: LRTableCellProtocol
    var rightCellProtocol: LRTableCellProtocol
}
