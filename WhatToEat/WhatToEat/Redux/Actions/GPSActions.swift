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

struct MKAnnotationDidSelectAction: Action {
    let selectedIndex: Int
    let selectedLoc: GQInputObject?
}
struct LocatePositionAction: Action {
    var status: LocatePositionStatus
    let locations: [CLLocation]?
}
struct MapShowAnnotationsAction: Action {
    let annotions:[MKPointAnnotation]
}
struct MapRemoveAllAnnotationsAction: Action {
}
struct MapClearAndShowAnnotationsAction: Action {
    let annotions:[MKPointAnnotation]
}
