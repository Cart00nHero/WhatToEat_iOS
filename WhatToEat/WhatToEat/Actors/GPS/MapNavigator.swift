//
//  MapNavigator.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/9/18.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class MapNavigator: NSObject {

    class func setCenterCoordinate(mapView: MKMapView, coordinate: CLLocationCoordinate2D) {
        mapView.centerCoordinate = coordinate
    }
    class func showCircleOverlay(mapView: MKMapView, radius: CLLocationDistance) {
        showCircle(mapView: mapView, coordinate: mapView.camera.centerCoordinate, radius: radius)
    }
    class func displayAnnotations(mapView: MKMapView, annotations: [MKPointAnnotation], animated: Bool) {
        mapView.showAnnotations(annotations, animated: animated)
    }
    
    class func removeAllMapAnnotations(mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
    }
    class func showCircle(mapView: MKMapView, coordinate: CLLocationCoordinate2D,radius: CLLocationDistance) {
        // Radius is measured in meters
        if mapView.overlays.count > 0 {
            mapView.removeOverlays(mapView.overlays)
        }
        let circle = MKCircle(center: coordinate,radius: radius)
        mapView.addOverlay(circle)
    }
}
