//
//  TableCellData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/11/14.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

enum TemplateStyle : Int {
    case LeftRight,Button,RadarMap
}

enum ViewType : Int {
    case TextLabel,TextField, DropDown, Range, AddressInput
}

protocol TemplateProtocol {
    var templateStyle: TemplateStyle { get }
    var itemHeight: CGFloat { get set }
}

struct LRCellTemplate: TemplateProtocol {
    let templateStyle: TemplateStyle = .LeftRight
    var leftViewItem: ViewItemProtocol
    var rightViewItem: ViewItemProtocol
    var itemHeight: CGFloat = 48.0
}

protocol ViewItemProtocol {
    var viewType: ViewType { get }
}
struct DateRangeItem: ViewItemProtocol {
    let viewType: ViewType = .Range
    var starDate: Date = Date()
    var endDate: Date = Date()
}
struct DropDownItem: ViewItemProtocol {
    let viewType: ViewType = .DropDown
    var placeHolder = ""
    var optionArray: Array<String>?
    var optionImages: Array<UIImage>?
    var selectedText = ""
}
struct AddressInputItem: ViewItemProtocol {
    var viewType: ViewType = .AddressInput
    var address: GQInputObject
    
}
struct LabelItem: ViewItemProtocol {
    let viewType: ViewType = .TextLabel
    var numberOfLines = 1
    var text = ""
}

struct TextFieldItem: ViewItemProtocol {
    let viewType: ViewType = .TextField
    var keyboardType: UIKeyboardType = .default
    var placeHolder = ""
    var text = ""
}
