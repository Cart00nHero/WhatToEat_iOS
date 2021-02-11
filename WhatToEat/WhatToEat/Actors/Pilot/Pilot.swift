//
//  Pilot.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/12.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn
import CoreLocation

enum AccuracyType : Int {
    case ACCURACY_DEFAULT,ACCURACY_BEST_FOR_NAVIGATION,ACCURACY_BEST,
    ACCURACY_NEAREST_TENMETERS,ACCURACY_HUNDRED_METERS,
    ACCURACY_KIIOMETER,ACCURACY_THREE_KILOMETERS
}
enum RequestAuthorization : Int {
    case REQUEST_AUTHORIZATION_ALWAYS,
    REQUEST_AUTHORIZATION_WHENINUSE
}
enum LocatePositionStatus {
    case DidStarted
    case DidUpdateLocation
    case DidFailWithError
    case DidChangeAuthorization
}

protocol LocationServiceDelegate {
    func locationManager(didUpdateLocations locations: [CLLocation])
    func locationManager(didFailWithError error: Error)
    func locationManager(didChangeAuthorization status: CLAuthorizationStatus)
}

class Pilot: Actor {
    
}
