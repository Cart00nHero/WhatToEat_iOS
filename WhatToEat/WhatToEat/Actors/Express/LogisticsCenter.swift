//
//  LogisticsCenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/11.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn

struct Parcel {
    let contentType: String
    var sender = ""
    var content: Any
}
class LogisticsCenter: NSObject {
    static let shared = LogisticsCenter()
    private let courier = Courier()
    
    func applyExpressService<T>(
        sender: Actor, recipient: String,content: T) -> Parcel {
        let typeName = String(describing: type(of: T.self))
        let senderName = String(describing: type(of: sender))
        let parcel =
            Parcel(contentType: typeName, sender: senderName, content: content)
        courier.beClaimParcel(recipient, parcel)
        return parcel
    }
    func cancelService(recipient:String, parcel: Parcel) {
        courier.beCancel(recipient, parcel)
    }
    func collectParcels(recipient: Actor,complete: @escaping (NSSet?) -> Void) {
        courier.beCollect(recipient, complete)
    }
}
