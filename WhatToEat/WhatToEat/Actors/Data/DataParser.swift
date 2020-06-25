//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func combineAddressCompleteInfo(address: GQInputObject) -> String {
    let mutabletext = NSMutableString(string: (address.address.administrativeArea ?? "") ?? "")
    mutabletext.append((address.address.subAdministrativeArea ?? "") ?? "")
    mutabletext.append((address.address.locality ?? "") ?? "")
    mutabletext.append((address.address.thoroughfare ?? "") ?? "")
    mutabletext.append(" ")
    mutabletext.append((address.address.subThoroughfare ?? "") ?? "")
    return mutabletext as String
}

func combineFullInfo(address: GQInputObject) -> String {
    let shop = address.shop
    let fullInfoText = NSMutableString(string: shop.title)
    fullInfoText.append("，")
    fullInfoText.append(address.shopBranch.name)
    fullInfoText.append("，")
    fullInfoText.append(address.address.completeInfo)
    return fullInfoText as String
}

func locationsDynamicQueryToGQAddress(result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?) -> GQInputObject {
    var inputObj = initGQInputObject()
    var address = inputObj.address
    for key in address.graphQLMap.keys {
        let value = result?.resultMap[key]
        address.graphQLMap.updateValue(value, forKey: key)
    }
    inputObj.address = address
    
    var branch = inputObj.shopBranch
    for key in branch.graphQLMap.keys {
        let value = result?.shopBranch?.resultMap[key]
        branch.graphQLMap.updateValue(value, forKey: key)
    }
    inputObj.shopBranch = branch
    
    var shop = inputObj.shop
    for key in shop.graphQLMap.keys {
        let value = result?.shopBranch?.shop?.resultMap[key]
        shop.graphQLMap.updateValue(value, forKey: key)
    }
    inputObj.shop = shop
    
    return inputObj
}
