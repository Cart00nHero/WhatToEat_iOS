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

enum CellContentType : Int {
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
    var contentType: CellContentType { get }
    var cellHeight: CGFloat { get set }
}
struct RangeCell: CellProtocol {
    let contentType: CellContentType = .Range
    var starDate: Date = Date()
    var endDate: Date = Date()
    var cellHeight: CGFloat = 48.0
}
struct DropDownCell: CellProtocol {
    let contentType: CellContentType = .DropDown
    var cellHeight: CGFloat = 48.0
    var placeHolder = ""
    var optionArray: Array<String>?
    var optionImages: Array<UIImage>?
    var selectedText = ""
}
struct AddressInputCell: CellProtocol {
    var contentType: CellContentType = .AddressInput
    var cellHeight: CGFloat = 100.0
    var address: GQInputObject
    
}
struct LabelCell: CellProtocol {
    let contentType: CellContentType = .TextLabel
    var cellHeight: CGFloat = 48.0
    var numberOfLines = 1
    var text = ""
}

struct TextFieldCell: CellProtocol {
    let contentType: CellContentType = .TextField
    var cellHeight: CGFloat = 48.0
    var keyboardType: UIKeyboardType = .default
    var hint = ""
    var text = ""
}
