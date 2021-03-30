//
//  GQInputData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/7.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct GQInputObject {
    var branchId = ""
    var address: InputAddress
    var shopBranch: InputBranch
    
    init(address: InputAddress ,shopBranch: InputBranch) {
        self.address = address
        self.shopBranch = shopBranch
    }
}

func initGQInputObject() -> GQInputObject {
    return GQInputObject(
        address: initInputAddress(),
        shopBranch: initInputBranch()
    )
}

func initInputBranch() -> InputBranch {
    return InputBranch(style: "", subtitle: "", tel: "", title: "", type: "", underPrice: 0.0)
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
