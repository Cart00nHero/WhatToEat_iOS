//
//  RandomNumber.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/4/30.
//

import Foundation

func randomInt(min: Int,max: Int) -> Int {
    if min <= max {
        return Int.random(in: min..<max)
    }
    return 0
}
func randomDouble(min: Double, max: Double) -> Double {
    if min <= max {
        return Double.random(in: min...max)
    }
    return 0.0
}
