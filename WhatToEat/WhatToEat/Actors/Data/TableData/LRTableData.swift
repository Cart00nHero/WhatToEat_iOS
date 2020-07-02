//
//  LRTableData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/11.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

enum LRCellStyle : Int {
    case TextLabel,TextField, DropDown, Range, AddressInput
}
struct LRRangeCellData: LRTableCellProtocol {
    let cellStyle: LRCellStyle = .Range
    var starDate: Date = Date()
    var endDate: Date = Date()
    var cellHeight: CGFloat = 48.0
}
struct LRDropDownCellData: LRTableCellProtocol {
    let cellStyle: LRCellStyle = .DropDown
    var cellHeight: CGFloat = 48.0
    var placeHolder = ""
    var optionArray: Array<String>?
    var optionImages: Array<UIImage>?
    var selectedText = ""
}
struct LRAddressInputCellView: LRTableCellProtocol {
    var cellStyle: LRCellStyle = .AddressInput
    var cellHeight: CGFloat = 100.0
    var address: GQInputObject
    
}
struct LRLabelCellData: LRTableCellProtocol {
    let cellStyle: LRCellStyle = .TextLabel
    var cellHeight: CGFloat = 48.0
    var numberOfLines = 1
    var labelText = ""
}

struct LRTextFieldCellData: LRTableCellProtocol {
    let cellStyle: LRCellStyle = .TextField
    var cellHeight: CGFloat = 48.0
    var keyboardType: UIKeyboardType = .default
    var placeHolder = ""
    var inputText = ""
}

protocol LRTableCellProtocol {
    var cellStyle: LRCellStyle { get }
    var cellHeight: CGFloat { get set }
}

struct LRCellData: CellDataProtocol {
    let templateStyle: CellTemplateStyle = .LeftRight
    var leftCellProtocol: LRTableCellProtocol
    var rightCellProtocol: LRTableCellProtocol
}
