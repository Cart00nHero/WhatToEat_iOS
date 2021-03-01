//
//  GQResponseData.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/14.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import Foundation
/*
 field :unique_id, :string
     field :email, :string
     field :name, :string
     field :gender, :integer
 */
struct Foodie: MapConvertable {
    let uniqueId: String
    let email: String
    let name: String
}

struct Address: MapConvertable {
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
    var floor: String?
    var annotation: String?
    var shopBranch: ShopBranch?
    init() {
    }
}
struct ShopBranch: MapConvertable {
    let uniqueId: String?
    let name: String?
    let openTime: Date?
    let closeTime: Date?
    let tel: String?
    let shop: Shop?
    let foodies: [Foodie]?
}

struct Branch: MapConvertable {
    let uniqueId: String?
    let name: String?
    let openTime: Date?
    let closeTime: Date?
    let tel: String?
    let address: Address?
    let foodies: [Foodie]?
}

struct Shop: MapConvertable {
    let uniqueId: String?
    let title: String?
    let style: String?
    let type: String?
    var status: Int = 0
    var underPrice: Float64 = 0.0
    let branches: [Branch]?
}

struct DynamicQueryData<T: Codable>: Codable {
    let data: T
}
struct LocDynamicQueryData: Codable {
    let locationsDynamicQuery: [Address]?
}
