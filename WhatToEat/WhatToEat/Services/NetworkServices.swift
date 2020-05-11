//
//  NetworkServices.swift
//  WhatToEat
//
//  Created by Wei Jen Wang on 2020/5/11.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import Apollo

class NetworkServices {
    static let shared = NetworkServices()
      
    private(set) lazy var apollo = ApolloClient(url: URL(string: "http://18.181.145.108:8080/graphiql/api")!)
}
