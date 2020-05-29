//
//  ApiData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/24.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import Foundation

struct Foodie: Codable {
    let uniqueId: String
    let email: String
    let name: String
    let gender: Int
    let token: Dictionary<String, String>
    let branches: [ShopBranch]?
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
    let address: Address
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
