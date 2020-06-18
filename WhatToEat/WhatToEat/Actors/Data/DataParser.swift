//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func combineAddressCompleteInfo(address: GQAddress) -> String {
    let mutabletext = NSMutableString(string: address.administrativeArea ?? "")
    mutabletext.append(address.subAdministrativeArea ?? "")
    mutabletext.append(address.locality ?? "")
    mutabletext.append(address.thoroughfare ?? "")
    mutabletext.append(" ")
    mutabletext.append(address.subThoroughfare ?? "")
    return mutabletext as String
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

func locationsDynamicQueryToGQAddress(result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?) -> GQAddress {
    var branch = InputBranch()
    for key in result!.shopBranch!.resultMap.keys {
        let value = result?.shopBranch?.resultMap[key]
        branch.graphQLMap.updateValue(value, forKey: key)
    }
    
    branch.graphQLMap.removeValue(forKey: "__typename")
    var shop = InputShop()
    for key in result!.shopBranch!.shop!.resultMap.keys {
        let value = result?.shopBranch?.shop?.resultMap[key]
        shop.graphQLMap.updateValue(value, forKey: key)
    }
    shop.graphQLMap.removeValue(forKey: "__typename")
    
    branch.shop = shop
    var address = GQAddress(shopBranch: branch)
    address.ownerType = result?.ownerType
    address.latitude = Double(result?.latitude! ?? "0.0")!
    address.longitude = Double(result?.longitude! ?? "0.0")!
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
