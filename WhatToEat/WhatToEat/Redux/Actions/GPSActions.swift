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
    var status: GeoCodeStatus = .Started
    var location: CLLocation? = nil
    var error: Error? = nil
}

func geoCodeAddressAction(address: String) -> GeoCodeAddressAction {
    var action = GeoCodeAddressAction()
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
    var status: GeoCodeStatus = .Started
    var place: CLPlacemark? = nil
    var error: Error? = nil
}
func reverseLocationAction(location: CLLocation) -> ReverseLocationAction {
    var action = ReverseLocationAction()
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
    var status: GeoCodeStatus = .Started
    var annotations: [MKPointAnnotation] = []
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
