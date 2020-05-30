//
//  DeliveryActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/28.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

struct SendParcelAction: Action {
    let parcel: ParcelObject
}
struct ReceivedParcelAction: Action {
}
struct SignParcelReceiptAction: Action {
    let recipient: String
}
