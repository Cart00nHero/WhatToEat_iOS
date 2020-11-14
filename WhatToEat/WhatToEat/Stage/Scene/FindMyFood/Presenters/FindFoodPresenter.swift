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
    var dataSource: Array<CellTemplateProtocol> = []
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
    private func createDataSource() -> Array<CellTemplateProtocol> {
        return [
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Title"),
                       rightCellProtocol: LabelCell(labelText: self.dataObj.shopBranch?.shop?.title ?? "")),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Style"),
                       rightCellProtocol: LabelCell(labelText: (self.dataObj.shopBranch?.shop?.style ?? "") )),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Type"),
                       rightCellProtocol: LabelCell(labelText: (self.dataObj.shopBranch?.shop?.type ?? "") )),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Under\nPrice"),
                       rightCellProtocol: LabelCell(labelText:
                                                            String(format: "%.2f", (self.dataObj.shopBranch?.shop?.underPrice ?? 0.0)!))),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Name"),
                       rightCellProtocol: LabelCell(labelText: "")),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Business\nHours"),
                       rightCellProtocol: RangeCell(starDate: convertStringToUTC_ISO8601Date(dateString: (dataObj.shopBranch?.openTime ?? "")),
                                                          endDate: convertStringToUTC_ISO8601Date(dateString: (dataObj.shopBranch?.closedTime ?? "")))),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Tel"),
                       rightCellProtocol: LabelCell(labelText: (dataObj.shopBranch?.tel ?? "") )),
            LRCellTemplate(leftCellProtocol: LabelCell(labelText: "Address"),
                       rightCellProtocol: LabelCell(labelText: dataObj.completeInfo ?? "")),
            ButtonCellTmplt(cornerRadius: 2.0, titleText: "Navigation",isHidden: hideNavButton)
        ]
    }
}
