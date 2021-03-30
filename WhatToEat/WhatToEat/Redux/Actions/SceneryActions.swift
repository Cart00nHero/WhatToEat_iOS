//
//  SceneryActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import MapKit

struct TableCellButtonClickAction: Action {
    let cell: UITableViewCell
    let button: UIButton
}

struct CellDropDownMenuSelectedAction: Action {
    let dropdownView: DropDownCellView
    let selectedIndex: Int
    let selectedText: String
}

struct AdjustForKeyboardAction: Action {
    let notification: Notification
    init(notification: Notification) {
        self.notification = notification
    }
}

struct CellTextFieldDidChangedAction: Action {
    let cell: UITableViewCell
    let textField: UITextField
}
struct ReceivedTapAction: Action {
    let tapGesture: UITapGestureRecognizer
}

struct RangeDatePickerSelectedAction: Action {
    let rangeView: SetRangeCellView
    let startDate: Date
    let endDate: Date
}
struct GoAddGourmetScenarioAction: Action {
}
struct GoGoogleNavigationAction: Action {
}
struct GoMenuSeceneAction: Action {
}
