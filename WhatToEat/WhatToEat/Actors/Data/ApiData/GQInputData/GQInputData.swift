//
//  GQInputData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/7.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct GQAddress {
    var address: InputAddress
    var shopBranch: InputBranch
    init(address: InputAddress ,shopBranch: InputBranch) {
        self.address = address
        self.shopBranch = shopBranch
    }
}

struct GQShop {
    var uniqueId: String?
    var title: String?
    var style: String?
    var type: String?
    var status: Int = 0
    var underPrice: Float64 = 0.0
    var branches: [InputBranch]
}

func getInitGQAddress() -> GQAddress {
    return GQAddress(address: InputAddress(completeInfo: "", fullInfo: "", latitude: "0.0", longitude: "0.0"),
                     shopBranch: InputBranch(name: "", shop: InputShop(underPrice: 0.00)))
}
