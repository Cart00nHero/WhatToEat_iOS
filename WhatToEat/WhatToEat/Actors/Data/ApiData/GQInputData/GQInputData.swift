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

func combineFullInfo(address: GQAddress) -> String {
    let shop = address.shopBranch.shop ?? InputShop()
    let fullInfoText = NSMutableString(string: shop?.title! ?? "")
    fullInfoText.append("，")
    fullInfoText.append(address.shopBranch.name! ?? "")
    fullInfoText.append("，")
    fullInfoText.append(address.completeInfo ?? "")
    return fullInfoText as String
}

func pareAddressGraphQLResult(result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?) -> GQAddress {
    var address = GQAddress(shopBranch: InputBranch())
    address.ownerType = result?.ownerType
    address.latitude = Double(result?.latitude! ?? "0.0")!
    address.longitude = Double(result?.longitude! ?? "0.0")!
    address.completeInfo = result?.completeInfo
    address.completeInfo = result?.completeInfo
    address.fullInfo = result?.fullInfo
    address.nation = result?.nation
    address.isoNationCode = result?.isoNationCode
    address.locality = result?.locality
    address.subLocality = result?.subLocality
    address.administrativeArea = result?.administrativeArea
    address.subAdministrativeArea = result?.subAdministrativeArea
    address.postalCode = result?.postalCode
    address.thoroughfare = result?.thoroughfare
    address.subThoroughfare = result?.subThoroughfare
    address.floor = result?.floor
    address.annotation = result?.floor
    
    return address
}
