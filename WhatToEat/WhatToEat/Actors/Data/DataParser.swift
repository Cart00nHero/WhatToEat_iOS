//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func combineAddressCompleteInfo(address: GQAddress) -> String {
    let mutabletext = NSMutableString(string: (address.address.administrativeArea ?? "") ?? "")
    mutabletext.append((address.address.subAdministrativeArea ?? "") ?? "")
    mutabletext.append((address.address.locality ?? "") ?? "")
    mutabletext.append((address.address.thoroughfare ?? "") ?? "")
    mutabletext.append(" ")
    mutabletext.append((address.address.subThoroughfare ?? "") ?? "")
    return mutabletext as String
}

func combineFullInfo(address: GQAddress) -> String {
    let shop = address.shopBranch.shop
    let fullInfoText = NSMutableString(string: (shop.title ?? "") ?? "")
    fullInfoText.append("，")
    fullInfoText.append(address.shopBranch.name)
    fullInfoText.append("，")
    fullInfoText.append(address.address.completeInfo)
    return fullInfoText as String
}

func locationsDynamicQueryToGQAddress(result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?) -> GQAddress {
    var address = getInitGQAddress()
    for key in result!.resultMap.keys {
        let value = result?.resultMap[key]
        address.address.graphQLMap.updateValue(value, forKey: key)
    }
    var branch = address.shopBranch
    for key in result!.shopBranch!.resultMap.keys {
        let value = result?.shopBranch?.resultMap[key]
        branch.graphQLMap.updateValue(value, forKey: key)
    }
    var shop = address.shopBranch.shop
    for key in result!.shopBranch!.shop!.resultMap.keys {
        let value = result?.shopBranch?.shop?.resultMap[key]
        shop.graphQLMap.updateValue(value, forKey: key)
    }
    
    address.shopBranch.shop = shop
    
    return address
}
