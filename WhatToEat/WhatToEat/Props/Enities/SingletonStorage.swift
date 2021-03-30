//
//  SingletonStorage.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/25.
//

import Foundation

class SingletonStorage: NSObject {
    static let shared = SingletonStorage()
    var apolloURL = "https://what2eat-dev.herokuapp.com/graphql/api"
    var foodieId = ""
    
}
