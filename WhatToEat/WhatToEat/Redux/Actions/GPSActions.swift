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

enum GeoActionStatus: Int {
    case Started, Completed, NotFound, Failed
}
struct GeoCodeAddressAction: Action {
    var codedAdress: String
    var status: GeoActionStatus = .Started
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
    var status: GeoActionStatus = .Started
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


struct ParsePlaceMarkToAddressAction: Action {
    let queryLoc: Bool
    let placeMark:CLPlacemark
    var inputObj: GQInputObject
    lazy var addressDqCmd = AddressDqCmd()
    
    init(queryLoc: Bool,placeMark: CLPlacemark,address: GQInputObject) {
        self.queryLoc = queryLoc
        self.placeMark = placeMark
        self.inputObj = address
        if self.queryLoc {
            queryLocation()
        }
        parsePlaceMarktoAddress()
    }
    private mutating func parsePlaceMarktoAddress() {
        inputObj.address.latitude = String(format: "%f", placeMark.location?.coordinate.latitude ?? 0.0)
        inputObj.address.longitude = String(format: "%f", placeMark.location?.coordinate.longitude ?? 0.0)
        inputObj.address.nation = placeMark.country
        inputObj.address.isoNationCode = placeMark.isoCountryCode
        inputObj.address.locality = placeMark.locality
        inputObj.address.subLocality = placeMark.subLocality
        inputObj.address.administrativeArea = placeMark.administrativeArea
        inputObj.address.subAdministrativeArea = placeMark.subAdministrativeArea
        inputObj.address.postalCode = placeMark.postalCode
        inputObj.address.thoroughfare = placeMark.thoroughfare
        inputObj.address.subThoroughfare = placeMark.subThoroughfare
    }
    private mutating func queryLocation() {
        if placeMark.country != nil {
            addressDqCmd.nation = placeMark.country
        }
        if placeMark.isoCountryCode != nil {
            addressDqCmd.isoNationCode = placeMark.isoCountryCode
        }
        if placeMark.locality != nil {
            addressDqCmd.locality = placeMark.locality
        }
        if placeMark.subLocality != nil {
            addressDqCmd.subLocality = placeMark.subLocality
        }
        if placeMark.administrativeArea != nil {
            addressDqCmd.administrativeArea = placeMark.administrativeArea
        }
        if placeMark.subAdministrativeArea != nil {
            addressDqCmd.subAdministrativeArea = placeMark.subAdministrativeArea
        }
        if placeMark.postalCode != nil {
            addressDqCmd.postalCode = placeMark.postalCode
        }
        if placeMark.thoroughfare != nil {
            addressDqCmd.thoroughfare = placeMark.thoroughfare
        }
        if placeMark.subThoroughfare != nil {
            addressDqCmd.subThoroughfare = placeMark.subThoroughfare
        }
        appStore.dispatch(locationsDynamicQueryAction(whereCMD: addressDqCmd))
    }
}
struct MKAnnotationDidSelectAction: Action {
    let selectedIndex: Int
    let selectedLoc: GQInputObject?
}
struct LocatePositionAction: Action {
    var status: LocatePositionStatus
    var locations: [CLLocation]?
    var error: Error?
}

struct SearchNearbyAction: Action {
    let center: CLLocationCoordinate2D
    let range: Float64
    
    init(center: CLLocationCoordinate2D, range: Float64) {
        self.center = center
        self.range = range
        let rangePoint = calculateRange(coordinate: center, range: range)
        appStore.dispatch(searchForRangeAction(foodieId: nil, min: rangePoint.min, max: rangePoint.max))
    }
}
