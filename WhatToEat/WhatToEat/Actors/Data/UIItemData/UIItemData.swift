//
//  UIItemData.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/1/24.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
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

struct LRTemplate: TemplateProtocol {
    let templateStyle: TemplateStyle = .LeftRight
    var leftViewItem: ViewItemProtocol
    var rightViewItem: ViewItemProtocol
    var leftViewWidth: Int = 64
    var itemHeight: CGFloat = 48.0
}

struct ButtonTemplate: TemplateProtocol {
    let templateStyle: TemplateStyle = .Button
    var cornerRadius: CGFloat = 0.0
    var titleText = ""
    var isHidden = false
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
