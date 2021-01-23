//
//  FindFoodPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/2.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class FindFoodPresenter: NSObject {
    
    enum GestureStaus {
        case None,TouchBegin,MutiTouches,Ended
    }
    
    var isFirsTimeEntrance = true
    var willMarkAnnotations = false
    var tableData = FindFoodTableData(dataObj: SearchForRangeQuery.Data.SearchForRange())
    var currentLoc: CLLocation? = nil
    var centerCoordinate: CLLocationCoordinate2D? = nil
    var annotations: [MKPointAnnotation] = []
    var mapZoomLevel: Int = 17
    var preZoomLevel: Int = 0
    var searchResults = [SearchForRangeQuery.Data.SearchForRange?]()
    var gestureStaus: GestureStaus = .None
    var searchCounts = 0
    
    
    
    func setMapZoomLevel(mapView: MKMapView, level: Int,center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion( center: center,
                                         latitudinalMeters: CLLocationDistance(exactly: regionDistance(zoomLevel: level))!,
                                         longitudinalMeters: CLLocationDistance(exactly: regionDistance(zoomLevel: level))!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
    }
    
    func searchRange(zoomLevel: Int) -> Float64 {
        // KM
        if zoomLevel >= 17 {
            return 0.2
        }
        if zoomLevel == 16 {
            return 0.5
        }
        if zoomLevel <= 15 {
            return 1.0
        }
        return 1.0
    }
    func isSearchRangeChanged() -> Bool {
        if preZoomLevel != mapZoomLevel {
            return true
        }
        return false
    }
    
    private func regionDistance(zoomLevel: Int) -> Float64 {
        if zoomLevel >= 17 {
            return 400.0
        }
        
        if zoomLevel == 16 {
            return 1000.0
        }
        if zoomLevel <= 15 {
            return 2000.0
        }
        return 1000.0
    }
    
}

struct FindFoodTableData {
    var dataObj: SearchForRangeQuery.Data.SearchForRange
    var dataSource: Array<TemplateProtocol> = []
    var hideNavButton = true
    
    init(dataObj: SearchForRangeQuery.Data.SearchForRange) {
        self.dataObj = dataObj
        dataSource = createDataSource()
    }
    //    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    mutating func reloadData(data: SearchForRangeQuery.Data.SearchForRange) {
        self.dataObj = data
        dataSource = createDataSource()
    }
    private func createDataSource() -> Array<TemplateProtocol> {
        return [
            LRCellTemplate(leftViewItem: LabelItem(text: "Title"),
                           rightViewItem: LabelItem(text: self.dataObj.shopBranch?.shop?.title ?? "")),
            LRCellTemplate(leftViewItem: LabelItem(text: "Style"),
                           rightViewItem: LabelItem(text: (self.dataObj.shopBranch?.shop?.style ?? "") )),
            LRCellTemplate(leftViewItem: LabelItem(text: "Type"),
                           rightViewItem: LabelItem(text: (self.dataObj.shopBranch?.shop?.type ?? "") )),
            LRCellTemplate(leftViewItem: LabelItem(text: "Under\nPrice"),
                           rightViewItem: LabelItem(text:
                                                            String(format: "%.2f", (self.dataObj.shopBranch?.shop?.underPrice ?? 0.0)!))),
            LRCellTemplate(leftViewItem: LabelItem(text: "Name"),
                           rightViewItem: LabelItem(text: "")),
            LRCellTemplate(leftViewItem: LabelItem(text: "Tel"),
                           rightViewItem: LabelItem(text: (dataObj.shopBranch?.tel ?? "") )),
            LRCellTemplate(leftViewItem: LabelItem(text: "Address"),
                           rightViewItem: LabelItem(text: dataObj.completeInfo ?? "")),
            BtnCellTemplate(cornerRadius: 2.0, titleText: "Navigation",isHidden: hideNavButton)
        ]
    }
}
