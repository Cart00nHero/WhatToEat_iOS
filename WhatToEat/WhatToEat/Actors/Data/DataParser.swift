//
//  DataParser.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/15.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func locDQToGQInputObj(
    result: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) -> GQInputObject {
    var inputObj = initGQInputObject()
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
    let address =
        result.resultMap.toInputAddress(address: inputObj.address)
    inputObj.address = address
    
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
    let branch =
        result.shopBranch?.resultMap.toInputBranch(
            branch: inputObj.shopBranch)
    inputObj.shopBranch = branch ?? initInputBranch()
    return inputObj
}
func convertSearchForRangeGQInputObj(
    result: SearchForRangeQuery.Data.SearchForRange) -> GQInputObject {
    var inputObj = initGQInputObject()
    let address =
        result.resultMap.toInputAddress(address: inputObj.address)
    inputObj.address = address
    
    inputObj.branchId = result.shopBranch?.uniqueId ?? ""
    let branch =
        result.shopBranch?.resultMap.toInputBranch(
            branch: inputObj.shopBranch)
    inputObj.shopBranch = branch ?? initInputBranch()
    return inputObj
}

func isoNationCodeToLocaleId(isoCode: String) -> String {
    switch isoCode {
    case "CN": return "zh_Hans"
    case "HK": return "zh_Hant"
    case "JP": return "ja_JP"
    case "KR": return "ko"
    case "TW": return "zh_Hant_TW"
    default: return "en_US"
    }
}
