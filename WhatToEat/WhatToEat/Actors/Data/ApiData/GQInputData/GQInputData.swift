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
    var shop: InputShop
    
    
    init(address: InputAddress ,shopBranch: InputBranch, shop: InputShop) {
        self.address = address
        self.shopBranch = shopBranch
        self.shop = shop
    }
}

func getInitGQAddress() -> GQAddress {
//    shop: InputShop(title: "", underPrice: 0.00)
    return GQAddress(address: InputAddress(completeInfo: "", fullInfo: "", latitude: "0.0", longitude: "0.0"),
                     shopBranch: InputBranch(name: ""), shop: InputShop(title: "", underPrice: 0.00))
}
