//
//  GQInputData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/7.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct GQInputObject {
    var shopId = ""
    var branchId = ""
    var address: InputAddress
    var shopBranch: InputBranch
    var shop: InputShop
    
    
    init(address: InputAddress ,shopBranch: InputBranch, shop: InputShop) {
        self.address = address
        self.shopBranch = shopBranch
        self.shop = shop
    }
}

func initGQInputObject() -> GQInputObject {
    return GQInputObject(
        address: initInputAddress(),
        shopBranch: initInputBranch(),
        shop: initInputShop()
    )
}
func initInputShop() -> InputShop {
    return InputShop(title: "", underPrice: 0.0)
}
func initInputBranch() -> InputBranch {
    return InputBranch(name: "")
}
func initInputAddress() -> InputAddress {
    return InputAddress(
        administrativeArea: "", completeInfo: "",
        isoNationCode: "", latitude: "0.0",
        locality: "", longitude: "0.0", nation: "",
        subAdministrativeArea: "", subLocality: "",
        subThoroughfare: "", thoroughfare: "")
}

struct GQSearchRange {
    let max: InputCoordinate
    let min: InputCoordinate
}
