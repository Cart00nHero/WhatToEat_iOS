//
//  GPSService.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/26.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import CoreLocation
import UIKit

class LocationMaster: NSObject {
    
    static let shared = LocationMaster()
    private var locationManager: CLLocationManager?
    var delegate: LocationServiceDelegate?

    private var isStartUpdatingLocation = false

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    /*
    init(target: Any?, distanceFilter meters: Double, accuracy accuracyType: AccuracyType) {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }*/
    func setAccuracyAndDistanceFilter(_ meters: Double, accuracy accuracyType: AccuracyType) {
        locationManager?.distanceFilter = CLLocationDistance(meters)
        switch accuracyType {
        case .ACCURACY_DEFAULT:
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        case .ACCURACY_BEST_FOR_NAVIGATION:
            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        case .ACCURACY_BEST:
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        case .ACCURACY_NEAREST_TENMETERS:
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        case .ACCURACY_HUNDRED_METERS:
            locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        case .ACCURACY_KIIOMETER:
            locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
        case .ACCURACY_THREE_KILOMETERS:
            locationManager?.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        }
    }
    func requestAuthorization(_ authorization: RequestAuthorization) {
        switch authorization {
        case .REQUEST_AUTHORIZATION_ALWAYS:
            if UIDevice.current.systemVersion.compare("8.0", options: .numeric) == .orderedDescending {
              locationManager?.requestAlwaysAuthorization()
            }
            if UIDevice.current.systemVersion.compare("9.0", options: .numeric) == .orderedDescending {
              locationManager?.allowsBackgroundLocationUpdates = true
          }
        case .REQUEST_AUTHORIZATION_WHENINUSE:
          if UIDevice.current.systemVersion.compare("8.0", options: .numeric) == .orderedDescending {
            locationManager?.requestWhenInUseAuthorization()
          }
          if UIDevice.current.systemVersion.compare("9.0", options: .numeric) == .orderedDescending {
            locationManager?.allowsBackgroundLocationUpdates = false
          }
        }
    }
    func startUpdatingLocation() {
        locationManager?.startUpdatingLocation()
        isStartUpdatingLocation = true
    }
    func requestCurrentLocation() {
        //request onece and accuracy select automatic
        //can't use together with startUpdatingLocation
        locationManager?.requestLocation()
    }
    func stopUpdatingLocation() {
        locationManager?.stopUpdatingLocation()
        isStartUpdatingLocation = false
    }
}

extension LocationMaster : CLLocationManagerDelegate {
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        appStore.dispatch(LocatePositionAction(status: .DidUpdateLocation,locations: locations))
    }
    internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        appStore.dispatch(LocatePositionAction(status: .DidFailWithError,error: error))
    }
    internal func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        appStore.dispatch(LocatePositionAction(status: .DidUpdateLocation))
    }
}
