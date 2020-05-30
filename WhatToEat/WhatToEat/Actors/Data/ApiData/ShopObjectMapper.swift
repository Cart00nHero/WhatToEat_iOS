//
//  ShopObjectMapper.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/29.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import ObjectMapper

class FoodieObj: Mappable {
    var uniqueId: String?
    var email: String?
    var name: String?
    var gender: Int = 0
    var token: [String : String] = [:]
    var branches: [ShopBranchObj]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        uniqueId <- map["unique_id"]
        email <- map["email"]
        name <- map["name"]
        gender <- map["gender"]
        branches <- map["branches"]
    }
    
}

class ShopObj: Mappable {
    
    @objc dynamic var uniqueId: String?
    @objc dynamic var title: String?
    @objc dynamic var style: String?
    @objc dynamic var type: String?
    @objc dynamic var status: Int = 0
    @objc dynamic var underPrice: Float64 = 0.0
    var branches: [ShopBranchObj] = []
    
    convenience required init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        uniqueId <- map["unique_id"]
        title <- map["title"]
        style <- map["style"]
        type <- map["type"]
        status <- map["status"]
        underPrice <- map["under_price"]
        branches <- map["branches"]
    }
}

class ShopBranchObj: Mappable {
    
    var uniqueId: String?
    var orderId: Int = 0
    var name: String?
    var openTime: Date?
    var closeTime: Date?
    var tel: String?
    var address: AddressObj?
    var foodies: [FoodieObj]?
    
    convenience required init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        uniqueId <- map["unique_id"]
        orderId <- map["order_id"]
        name <- map["name"]
        openTime <- (map["open_time"], DateTransform())
        closeTime <- (map["close_time"], DateTransform())
        tel <- map["tel"]
    }
}

class AddressObj: Mappable {
    
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
    var branch: ShopBranchObj?
    
    
    convenience required init?(map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        ownerType <- map["owner_type"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        completeInfo <- map["complete_info"]
        nation <- map["nation"]
        isoNationCode <- map["iso_nation_code"]
        locality <- map["locality"]
        subLocality <- map["sub_locality"]
        administrativeArea <- map["administrative_area"]
        subAdministrativeArea <- map["sub_administrativeArea"]
        postalCode <- map["postal_code"]
        thoroughfare <- map["thoroughfare"]
        subThoroughfare <- map["sub_thoroughfare"]
        annotation <- map["annotation"]
    }
    
}
