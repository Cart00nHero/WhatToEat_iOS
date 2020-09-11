//
//  MapActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/8/2.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import ReSwift
import MapKit

struct CreateMapAnnotationsAction: Action {
    var addresses: [GQInputObject]
    var actionType = ""
    var status: GeoActionStatus = .Started
    var annotations: [MKPointAnnotation] = []
    
    init(addresses: [GQInputObject]) {
        self.addresses = addresses
        actionType = String(describing: type(of: self))
    }
}

func createMapAnnotationsAction(inputObj: [GQInputObject]) -> CreateMapAnnotationsAction {
    var action = CreateMapAnnotationsAction(addresses: inputObj)
    let resultArray = NSMutableArray()
    DispatchQueue.global(qos: .background).async {
        for address in inputObj {
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
struct RegionWillChangeAction: Action{
}
struct MapRegionDidChangeAction: Action {
}
struct MapDidChangeVisibleRegionAction: Action {
}
struct MapWillAddAnnotationsAction: Action {
}
struct MapDidAddAnnotationsAction: Action {
}

struct MarkRangeSearchDataAction: Action {
    var status: GeoActionStatus = .Started
    var annotations: [MKPointAnnotation] = []
}
func markRangeSearchDataActions(queryData:[SearchInRangeQuery.Data.SearchInRange?]) -> MarkRangeSearchDataAction {
    var action = MarkRangeSearchDataAction()
    let annotations = NSMutableArray()
    DispatchQueue.global(qos: .background).async {
        for place in queryData {
            let latitude = Double(place!.latitude!) ?? 0.0
            let longitude = Double(place!.longitude!) ?? 0.0
            let location = CLLocation(latitude: latitude, longitude: longitude)
            let annotation = MKPointAnnotation()
            annotation.title = place?.shopBranch?.shop?.title
            annotation.subtitle = place?.shopBranch?.name
            annotation.coordinate = location.coordinate
            annotations.add(annotation)
        }
        action.annotations = annotations as? [MKPointAnnotation] ?? []
        DispatchQueue.main.async {
            action.status = .Completed
            appStore.dispatch(action)
        }
    }
    return action
}
