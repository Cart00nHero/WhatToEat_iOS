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
import UIKit

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

protocol PilotProtocol {
    @discardableResult
    func beLocationManager(didUpdateLocations locations: [CLLocation]) -> Self
    @discardableResult
    func beLocationManager(didFailWithError error: Error) -> Self
    @discardableResult
    func beLocationManager(didChangeAuthorization status: CLAuthorizationStatus) -> Self
}

fileprivate class GPSService: NSObject,CLLocationManagerDelegate {
    static let shared = GPSService()
    private let locationManager: CLLocationManager = CLLocationManager()
    private var isStartUpdatingLocation = false
    var delegate: PilotProtocol?
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func setAccuracyAndDistanceFilter(_ meters: Double, accuracy accuracyType: AccuracyType) {
        locationManager.distanceFilter = CLLocationDistance(meters)
        switch accuracyType {
        case .ACCURACY_DEFAULT:
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        case .ACCURACY_BEST_FOR_NAVIGATION:
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        case .ACCURACY_BEST:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .ACCURACY_NEAREST_TENMETERS:
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        case .ACCURACY_HUNDRED_METERS:
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        case .ACCURACY_KIIOMETER:
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        case .ACCURACY_THREE_KILOMETERS:
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        }
    }
    func requestAuthorization(_ authorization: RequestAuthorization) {
        switch authorization {
        case .REQUEST_AUTHORIZATION_ALWAYS:
            if UIDevice.current.systemVersion.compare("8.0", options: .numeric) == .orderedDescending {
                locationManager.requestAlwaysAuthorization()
            }
            if UIDevice.current.systemVersion.compare("9.0", options: .numeric) == .orderedDescending {
                locationManager.allowsBackgroundLocationUpdates = true
          }
        case .REQUEST_AUTHORIZATION_WHENINUSE:
          if UIDevice.current.systemVersion.compare("8.0", options: .numeric) == .orderedDescending {
            locationManager.requestWhenInUseAuthorization()
          }
          if UIDevice.current.systemVersion.compare("9.0", options: .numeric) == .orderedDescending {
            locationManager.allowsBackgroundLocationUpdates = false
          }
        }
    }
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
        isStartUpdatingLocation = true
    }
    func requestCurrentLocation() {
        //request onece and accuracy select automatic
        //can't use together with startUpdatingLocation
        locationManager.requestLocation()
    }
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
        isStartUpdatingLocation = false
    }
    
    // MARK: - LocationManager delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        delegate?.beLocationManager(didUpdateLocations: locations)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.beLocationManager(didChangeAuthorization: status)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.beLocationManager(didFailWithError: error)
    }
}

class Pilot: Actor {
    private let gpsService = GPSService.shared
    init(_ meters: Double, accuracy accuracyType: AccuracyType) {
        gpsService.setAccuracyAndDistanceFilter(meters, accuracy: accuracyType)
    }
    private func _beRegisterSender(_ sender: PilotProtocol) {
        gpsService.delegate = sender
    }
    private func _beRequestAuthorization(_ authorization: RequestAuthorization) {
        gpsService.requestAuthorization(authorization)
    }
    private func _beStart() {
        gpsService.startUpdatingLocation()
    }
    private func _beStop() {
        gpsService.stopUpdatingLocation()
    }
    private func _beRequestCurrentLocation() {
        gpsService.requestCurrentLocation()
    }
    private func _beCalculateDistance(
        sender: Actor,from: CLLocationCoordinate2D,
        to: CLLocationCoordinate2D,
        _ complete: @escaping (CLLocationDistance) -> Void) {
        Mathematician().beCalculateCoordinateDistance(
            sender, from: from, to: to, complete)
    }
}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension Pilot {

    @discardableResult
    public func beRegisterSender(_ sender: PilotProtocol) -> Self {
        unsafeSend { self._beRegisterSender(sender) }
        return self
    }
    @discardableResult
    public func beRequestAuthorization(_ authorization: RequestAuthorization) -> Self {
        unsafeSend { self._beRequestAuthorization(authorization) }
        return self
    }
    @discardableResult
    public func beStart() -> Self {
        unsafeSend(_beStart)
        return self
    }
    @discardableResult
    public func beStop() -> Self {
        unsafeSend(_beStop)
        return self
    }
    @discardableResult
    public func beRequestCurrentLocation() -> Self {
        unsafeSend(_beRequestCurrentLocation)
        return self
    }
    @discardableResult
    public func beCalculateDistance(sender: Actor, from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, _ complete: @escaping (CLLocationDistance) -> Void) -> Self {
        unsafeSend { self._beCalculateDistance(sender: sender, from: from, to: to, complete) }
        return self
    }

}
