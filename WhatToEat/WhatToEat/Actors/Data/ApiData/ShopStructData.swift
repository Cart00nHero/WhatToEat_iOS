//
//  ShopStructData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/29.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

import Foundation

struct Foodie: Codable {
    var uniqueId: String?
    var email: String?
    var name: String?
    var gender: Int
    var token: Dictionary<String, String>
    var branches: [ShopBranch]?
}

struct Shop: Codable {
    var uniqueId: String?
    var title: String?
    var style: String?
    var type: String?
    var status: Int = 0
    var underPrice: Float64 = 0.0
    var branches: [ShopBranch]
    init(branches: [ShopBranch]) {
        self.branches = branches
    }
}

struct ShopBranch: Codable {
    var uniqueId: String?
    var orderId: Int = 0
    var name: String?
    var openTime: Date?
    var closeTime: Date?
    var tel: String?
    var shop: Shop?
    var address: Address
    var foodies: [Foodie]?
    
    init(address: Address) {
        self.address = address
    }
}

struct Address: Codable {
    var ownerType: String?
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var completeInfo: String?
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
    var annotation: String?
    init() {
    }
}

func parseShopGraphQLData(branch: ShopBranch) -> InputBranch {
    
    var inputBranch = InputBranch()
    inputBranch.uniqueId = branch.uniqueId
    inputBranch.orderId = branch.orderId
    inputBranch.name = branch.name
    inputBranch.openTime = parseDateToString(branch.openTime ?? Date(), dateFormat: "HH:mm")
    inputBranch.closedTime = parseDateToString(branch.closeTime ?? Date(), dateFormat: "HH:mm")
    
    let address = branch.address
    var inputAddress = InputAddress()
    inputAddress.ownerType = address.ownerType
    inputAddress.latitude = String(format:"%f", address.latitude)
    inputAddress.longitude = String(format:"%f", address.longitude)
    inputAddress.completeInfo = address.completeInfo
    inputAddress.nation = address.nation
    inputAddress.isoNationCode = address.isoNationCode
    inputAddress.locality = address.locality
    inputAddress.subLocality = address.subLocality
    inputAddress.administrativeArea = address.administrativeArea
    inputAddress.subAdministrativeArea = address.subAdministrativeArea
    inputAddress.thoroughfare = address.thoroughfare
    inputAddress.subThoroughfare = address.subThoroughfare
    inputAddress.postalCode = address.postalCode
    inputAddress.annotation = address.annotation
    
    inputBranch.address = inputAddress
    
    return inputBranch
}
