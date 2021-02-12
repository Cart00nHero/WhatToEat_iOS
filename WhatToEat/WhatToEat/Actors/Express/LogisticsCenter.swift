//
//  LogisticsCenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/11.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn

class LogisticsCenter: NSObject {
    static let shareInstance = LogisticsCenter()
    private let courier = Courier()
    
    func applyExpressService(sender: Actor, recipient: String,
                             content: Any) {
        courier.bePackageParcel(
            sender: sender, recipient: recipient, content: content)
    }
    func collectPacels(_ recipient: Actor) {
        courier.beCollect(recipient) { (parcels) in
        }
    }
}
