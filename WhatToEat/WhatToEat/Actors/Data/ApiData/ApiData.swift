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
    let uniqueId: String
    let title: String
    let style: String
    let type: String
    let status: Int
    let underPrice: Float64
    let branches: [ShopBranch]
}

struct ShopBranch: Codable {
    let uniqueId: String
    let orderId: Int
    let name: String
    let openTime: Date
    let closeTime: Date
    let tel: String
    let shop: Shop
    let address: Address
}

struct Address: Codable {
    let ownerType: String
    let completeInfo: String
    let nation: String
    let nationCode: String
    let state: String
    let cityCounty: String
    let district: String
    let town: String
    let roadStreet: String
    let remainInfo: String
    let latitude: Double
    let longitude: Double
    let annotation: String
}
