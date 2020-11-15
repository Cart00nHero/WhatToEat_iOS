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
    var cellHeight: CGFloat { get set }
}

struct LRCellTemplate: CellTemplateProtocol {
    let templateStyle: CellTemplateStyle = .LeftRight
    var leftProtocol: CellProtocol
    var rightProtocol: CellProtocol
    var cellHeight: CGFloat = 48.0
}

protocol CellProtocol {
    var contentType: CellContentType { get }
}
struct RangeCell: CellProtocol {
    let contentType: CellContentType = .Range
    var starDate: Date = Date()
    var endDate: Date = Date()
}
struct DropDownCell: CellProtocol {
    let contentType: CellContentType = .DropDown
    var placeHolder = ""
    var optionArray: Array<String>?
    var optionImages: Array<UIImage>?
    var selectedText = ""
}
struct AddressInputCell: CellProtocol {
    var contentType: CellContentType = .AddressInput
    var address: GQInputObject
    
}
struct LabelCell: CellProtocol {
    let contentType: CellContentType = .TextLabel
    var numberOfLines = 1
    var text = ""
}

struct TextFieldCell: CellProtocol {
    let contentType: CellContentType = .TextField
    var keyboardType: UIKeyboardType = .default
    var placeHolder = ""
    var text = ""
}
