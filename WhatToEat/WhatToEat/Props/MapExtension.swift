//
//  MapExtension.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/5.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
    //缩放级别
    var zoomLevel: Int {
        //获取缩放级别
        get {
//            return log2(360 * Double(frame.size.width) / 256.0 / region.span.longitudeDelta)
            return Int(log2(360 * (Double(self.frame.size.width/256)/self.region.span.longitudeDelta)) + 1)
        }
        //设置缩放级别
        set (newZoomLevel){
            setCenterCoordinate(coordinate: self.centerCoordinate, zoomLevel: newZoomLevel,
                                animated: false)
        }
    }
    
    //设置缩放级别时调用
    private func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: Int,
                                     animated: Bool){
        let span = MKCoordinateSpan(latitudeDelta: 0,
                                    longitudeDelta: 360 / pow(2, Double(zoomLevel)) * Double(self.frame.size.width) / 256)
        setRegion(MKCoordinateRegion(center: centerCoordinate, span: span), animated: animated)
    }
}

class MKIndexPtAnnotation: MKPointAnnotation {
     var index: Int!

     init(index: Int) {
        self.index = index
     }
}
