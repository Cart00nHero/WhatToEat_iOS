//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

var globalFoodieId: String = ""

func locDQToGQInputObj(
    result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) -> GQInputObject {
    var inputObj = initGQInputObject()
    inputObj.shopId = result.shopBranch?.shop?.uniqueId ?? ""
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
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
func convertSearchForRangeGQInputObj(result: SearchForRangeQuery.Data.SearchForRange) -> GQInputObject {
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

func isoNationCodeToLocaleId(isoCode: String) -> String {
    switch isoCode {
    case "CN": return "zh_Hans"
    case "HK": return "zh_Hant_HK"
    case "JP": return "ja_JP"
    case "TW": return "zh_Hant_TW"
    default: return "en_US"
    }
}
