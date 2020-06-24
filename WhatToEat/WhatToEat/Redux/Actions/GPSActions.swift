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
    var addresses: [GQAddress]
    var actionType = ""
    var status: GeoCodeStatus = .Started
    var annotations: [MKPointAnnotation] = []
    
    init(addresses: [GQAddress]) {
        self.addresses = addresses
        actionType = String(describing: type(of: self))
    }
}

func createMapAnnotationsAction(addresses: [GQAddress]) -> CreateMapAnnotationsAction {
    var action = CreateMapAnnotationsAction(addresses: addresses)
    let resultArray = NSMutableArray()
    DispatchQueue.global(qos: .background).async {
        for address in addresses {
            let latitude = Double(address.address.latitude) ?? 0.0
            let longitude = Double(address.address.longitude) ?? 0.0
            let location = CLLocation(latitude: latitude, longitude: longitude)
            let annotation = MKPointAnnotation()
            annotation.title = address.shop.title 
            annotation.subtitle = address.shopBranch.name
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
    lazy var addressDqCmd = AddressDqCmd()
    
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
        address.address.latitude = String(format: "%.2f", placeMark.location?.coordinate.latitude ?? 0.0)
        address.address.longitude = String(format: "%.2f", placeMark.location?.coordinate.longitude ?? 0.0)
        address.address.nation = placeMark.country
        address.address.isoNationCode = placeMark.isoCountryCode
        address.address.locality = placeMark.locality
        address.address.subLocality = placeMark.subLocality
        address.address.administrativeArea = placeMark.administrativeArea
        address.address.subAdministrativeArea = placeMark.subAdministrativeArea
        address.address.postalCode = placeMark.postalCode
        address.address.thoroughfare = placeMark.thoroughfare
        address.address.subThoroughfare = placeMark.subThoroughfare
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
    let selectedAddress: GQAddress
}
struct LocatePositionAction: Action {
    var status: LocatePositionStatus
    var locations: [CLLocation]?
    var error: Error?
}
