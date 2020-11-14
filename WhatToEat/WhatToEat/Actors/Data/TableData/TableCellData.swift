//
//  TableCellData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/11/14.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

enum CellTemplateStyle : Int {
    case LeftRight,Button,RadarMap
}

enum CellContentStyle : Int {
    case TextLabel,TextField, DropDown, Range, AddressInput
}

protocol CellTemplateProtocol {
    var templateStyle: CellTemplateStyle { get }
}

struct LRCellTemplate: CellTemplateProtocol {
    let templateStyle: CellTemplateStyle = .LeftRight
    var leftProtocol: CellProtocol
    var rightProtocol: CellProtocol
}

protocol CellProtocol {
    var cellStyle: CellContentStyle { get }
    var cellHeight: CGFloat { get set }
}
struct RangeCell: CellProtocol {
    let cellStyle: CellContentStyle = .Range
    var starDate: Date = Date()
    var endDate: Date = Date()
    var cellHeight: CGFloat = 48.0
}
struct DropDownCell: CellProtocol {
    let cellStyle: CellContentStyle = .DropDown
    var cellHeight: CGFloat = 48.0
    var placeHolder = ""
    var optionArray: Array<String>?
    var optionImages: Array<UIImage>?
    var selectedText = ""
}
struct AddressInputCell: CellProtocol {
    var cellStyle: CellContentStyle = .AddressInput
    var cellHeight: CGFloat = 100.0
    var address: GQInputObject
    
}
struct LabelCell: CellProtocol {
    let cellStyle: CellContentStyle = .TextLabel
    var cellHeight: CGFloat = 48.0
    var numberOfLines = 1
    var labelText = ""
}

struct TextFieldCell: CellProtocol {
    let cellStyle: CellContentStyle = .TextField
    var cellHeight: CGFloat = 48.0
    var keyboardType: UIKeyboardType = .default
    var placeHolder = ""
    var inputText = ""
}
