//
//  CommonActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

struct TableCellDidLayoutSubviewsAction: Action {
    let cell: UITableViewCell
}

struct UIPanGestureRecognizerAction: Action {
    let sender: UIPanGestureRecognizer
}

struct ReceivedGestureRecognizerAction: Action {
    let sender: UIGestureRecognizer
}

struct GestureRecognizerEndedAction: Action {
    let sender: UIGestureRecognizer
}
