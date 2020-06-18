//
//  GQInputData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/7.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct GQAddress {
    var ownerType: String?
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var completeInfo: String?
    var fullInfo: String?
    var nation: String?
    // ex: TW
    var isoNationCode: String?
    // City ex: Taipei
    var locality: String?
    // District
    var subLocality: String?
    // State
    var administrativeArea: String?
    // County
    var subAdministrativeArea: String?
    // Zip code
    var postalCode: String?
    // Street / Road
    var thoroughfare: String?
    // ？號
    var subThoroughfare: String?
    var floor: String?
    var annotation: String?
    var shopBranch: InputBranch
    init(shopBranch: InputBranch) {
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
    return GQAddress(shopBranch: InputBranch(closedTime: "", name: "", openTime: "",
                                             shop: InputShop(style: "", title: "", type: "", underPrice: 0.0), tel: ""))
}
