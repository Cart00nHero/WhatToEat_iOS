//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

var foodieId: String = ""
func combineAddressCompleteInfo(input: GQInputObject) -> String {
    let mutabletext = NSMutableString(string: (input.address.administrativeArea ?? "") ?? "")
    mutabletext.append((input.address.subAdministrativeArea ?? "") ?? "")
    mutabletext.append((input.address.locality ?? "") ?? "")
    mutabletext.append((input.address.thoroughfare ?? "") ?? "")
    mutabletext.append(" ")
    mutabletext.append((input.address.subThoroughfare ?? "") ?? "")
    return mutabletext as String
}

func combineFullInfo(input: GQInputObject) -> String {
    let fullInfoText = NSMutableString(string: input.shopId)
    fullInfoText.append("，")
    fullInfoText.append(input.branchId)
    fullInfoText.append("，")
    fullInfoText.append(input.address.completeInfo)
    return fullInfoText as String
}

func locationsDynamicQueryToGQInputObj(result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) -> GQInputObject {
    var inputObj = initGQInputObject()
    
    var address = inputObj.address
    for key in address.graphQLMap.keys {
        let value = result.resultMap[key]
        if value != nil {
            address.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.address = address
    
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
    var branch = inputObj.shopBranch
    for key in branch.graphQLMap.keys {
        let value = result.shopBranch?.resultMap[key]
        if value != nil {
            branch.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.shopBranch = branch
    
    inputObj.shopId = result.shopBranch?.shop?.uniqueId ?? ""
    var shop = inputObj.shop
    for key in shop.graphQLMap.keys {
        let value = result.shopBranch?.shop?.resultMap[key]
        if value != nil {
            shop.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.shop = shop
    
    return inputObj
}
func parseSearchForRangeGQInputObj(result: SearchForRangeQuery.Data.SearchForRange) -> GQInputObject {
    var inputObj = initGQInputObject()
    var address = inputObj.address
    for key in address.graphQLMap.keys {
        let value = result.resultMap[key]
        if value != nil {
            address.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.address = address
    
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
    var branch = inputObj.shopBranch
    for key in branch.graphQLMap.keys {
        let value = result.shopBranch?.resultMap[key]
        if value != nil {
            branch.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.shopBranch = branch
    
    inputObj.shopId = result.shopBranch?.shop?.uniqueId ?? ""
    var shop = inputObj.shop
    for key in shop.graphQLMap.keys {
        let value = result.shopBranch?.shop?.resultMap[key]
        if value != nil {
            shop.graphQLMap.updateValue(value, forKey: key)
        }
    }
    inputObj.shop = shop
    
    return inputObj
}
