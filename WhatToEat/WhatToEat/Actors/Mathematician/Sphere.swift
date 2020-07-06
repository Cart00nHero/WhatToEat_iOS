//
//  Sphere.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/4.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

private let EARTH_RADIUS = 6371.0

func squarePoint(coordinate: CLLocationCoordinate2D, range: Float64) -> InputCoordinate {
    var squarePoint = InputCoordinate()
    let dLng = dlng(coordinate: coordinate, range: range)
    let dLat = dlat(coordinate: coordinate, range: range)
    let left_top = (coordinate.latitude+dLat, coordinate.longitude-dLng)
    let right_top = (coordinate.latitude + dLat, coordinate.longitude + dLng)
    let left_bottom = (coordinate.latitude - dLat, coordinate.longitude-dLng)
    let right_bottom = (coordinate.latitude - dLat, coordinate.longitude+dLng)
    
    
    
    return squarePoint
}

private func dlng(coordinate: CLLocationCoordinate2D, range: Float64) -> Double {
    let dLng = 2*asin(sin(range/(2*EARTH_RADIUS)/cos(deg2rad(coordinate.latitude))))
    return rad2deg(dLng)
}

private func dlat(coordinate: CLLocationCoordinate2D, range: Float64) -> Double {
    let dlLat = range / EARTH_RADIUS
    return rad2deg(dlLat)
}

private func deg2rad(_ number: Double) -> Double {
    return number * .pi / 180
}

private func rad2deg(_ number: Double) -> Double {
    return number * 180 / .pi
}

