//
//  GPSActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/27.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import MapKit

enum GeoCodeStatus: Int {
    case Started, Completed, NotFound, Failed
}
struct GeoCodeAddressAction: Action {
    var codedAdress: String
    var status: GeoCodeStatus = .Started
    var location: CLLocation? = nil
    var error: Error? = nil
}

func geoCodeAddressAction(address: String) -> GeoCodeAddressAction {
    var action = GeoCodeAddressAction(codedAdress: address)
    let geoCoder = CLGeocoder()
    geoCoder.geocodeAddressString(address) { (placemarks, error) in
        if error == nil {
            if placemarks?.count == 0 {
                action.status = .NotFound
                appStore.dispatch(action)
                return
            }
            let placemark = placemarks?.first
            action.location = placemark?.location
            action.status = .Completed
            appStore.dispatch(action)
        } else {
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    return action
}

struct ReverseLocationAction: Action {
    var reversedLocation: CLLocation
    var status: GeoCodeStatus = .Started
    var place: CLPlacemark? = nil
    var error: Error? = nil
}
func reverseLocationAction(location: CLLocation) -> ReverseLocationAction {
    var action = ReverseLocationAction(reversedLocation: location)
    let geoCoder = CLGeocoder()
    geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
        if error == nil {
            action.status = .Completed
            action.place = placemarks?.first
            appStore.dispatch(action)
        } else {
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    return action
}

struct CreateMapAnnotationsAction: Action {
    var actionType = ""
    var status: GeoCodeStatus = .Started
    var annotations: [MKPointAnnotation] = []
    
    init() {
        actionType = String(describing: type(of: self))
    }
}

func createMapAnnotationsAction(locations: [CLLocation]) -> CreateMapAnnotationsAction {
    var action = CreateMapAnnotationsAction()
    let resultArray = NSMutableArray()
    DispatchQueue.global(qos: .background).async {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = ""
            annotation.subtitle = ""
            annotation.coordinate = location.coordinate
            resultArray.add(annotation)
        }
        action.annotations = resultArray as? [MKPointAnnotation] ?? []
        DispatchQueue.main.async {
            action.status = .Completed
            appStore.dispatch(action)
        }
    }
    return action
}
struct ParePlaceMarkToAddressAction: Action {
    let queryLoc: Bool
    let placeMark:CLPlacemark
    var address: GQAddress
    lazy var inputAddress = InputAddress()
    
    init(queryLoc: Bool,placeMark: CLPlacemark,address: GQAddress) {
        self.queryLoc = queryLoc
        self.placeMark = placeMark
        self.address = address
        if self.queryLoc {
            queryLocation()
        }
        parePlaceMarktoAddress()
    }
    private mutating func parePlaceMarktoAddress() {
        address.nation = placeMark.country
        address.isoNationCode = placeMark.isoCountryCode
        address.locality = placeMark.locality
        address.subLocality = placeMark.subLocality
        address.administrativeArea = placeMark.administrativeArea
        address.subAdministrativeArea = placeMark.subAdministrativeArea
        address.postalCode = placeMark.postalCode
        address.thoroughfare = placeMark.thoroughfare
        address.subThoroughfare = placeMark.subThoroughfare
    }
    private mutating func queryLocation() {
        inputAddress.nation = placeMark.country
        inputAddress.isoNationCode = placeMark.isoCountryCode
        inputAddress.locality = placeMark.locality
        inputAddress.subLocality = placeMark.subLocality
        inputAddress.administrativeArea = placeMark.administrativeArea
        inputAddress.subAdministrativeArea = placeMark.subAdministrativeArea
        inputAddress.postalCode = placeMark.postalCode
        inputAddress.thoroughfare = placeMark.thoroughfare
        inputAddress.subThoroughfare = placeMark.subThoroughfare
        appStore.dispatch(locationsDynamicQueryAction(whereCMD: inputAddress))
    }
}

struct LocatePositionAction: Action {
    var status: LocatePositionStatus
    var locations: [CLLocation]?
    var error: Error?
}
