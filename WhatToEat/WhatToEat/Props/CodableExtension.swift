//
//  CodableExtension.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/14.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import Foundation

protocol Convertable: Codable {

}

// Convert struct to dictionary
extension Convertable {
    func convertToDict() -> Dictionary<String, Any>? {
        var dict: Dictionary<String, Any>? = nil

        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any>
        } catch {
            print(error)
        }

        return dict
    }
}
