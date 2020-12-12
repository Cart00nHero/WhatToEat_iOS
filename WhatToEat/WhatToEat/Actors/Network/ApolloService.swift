//
//  ApolloService.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/19.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import Apollo

class ApolloService: NSObject {
    static let shared = ApolloService()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://52.195.1.222:8080/gql/api")!)
}

func clearApolloServiceCache() {
    let service = ApolloService.shared.apollo
    service.clearCache()
}
