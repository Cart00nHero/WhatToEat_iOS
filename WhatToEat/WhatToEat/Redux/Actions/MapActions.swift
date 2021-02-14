//
//  MapActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/8/2.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import ReSwift
import MapKit

enum GeoActionStatus: Int {
    case Started, Completed, NotFound, Failed
}

struct MapDidChangeVisibleRegionAction: Action {
    let mapView: MKMapView
}
struct MapRegionWillChangeAction: Action{
    let mapView: MKMapView
}
struct MapRegionDidChangeAction: Action {
    let mapView: MKMapView
}
struct MapWillAddAnnotationsAction: Action {
}
struct MapDidAddAnnotationsAction: Action {
}
