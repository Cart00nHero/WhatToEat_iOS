//
//  RequestData.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/25.
//

import Foundation

class GetReviewStatusRequest: GetRequest {
    override func loadRequest() {
        super.loadRequest()
        path = "/review"
    }
}
