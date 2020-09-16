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
    
    var isFirsTimeEntrance = true
    var tableData = FindFoodTableData(dataObj: SearchInRangeQuery.Data.SearchInRange())
    var searchMapCell: RadarMapTableViewCell? = nil
    var currentLoc: CLLocation? = nil
    var centerCoordinate: CLLocationCoordinate2D? = nil
    var annotations: [MKPointAnnotation] = []
    var mapZoomLevel: Int = 16
    var willMarkAnnotations = false
    var searchResults = [SearchInRangeQuery.Data.SearchInRange?]()
    
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
    
    func isNeedUpdating() -> Bool {
        let distance = calculateCoordinateDistance(from: centerCoordinate!, to: (searchMapCell?.centerCoordinate())!)
        let searchingDistance = (searchRange(zoomLevel: searchMapCell?.mapZoomLevel() ?? 16)*1000)*2
        
        if searchMapCell?.mapZoomLevel() == mapZoomLevel {
            if distance > searchingDistance {
                return true
            }
            return false
        }
        
        return true
    }
}

struct FindFoodTableData {
    var dataObj: SearchInRangeQuery.Data.SearchInRange
    var dataSource: Array<Array<CellDataProtocol>> = []
    init(dataObj: SearchInRangeQuery.Data.SearchInRange) {
        self.dataObj = dataObj
        dataSource = createDataSource()
    }
//    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    mutating func reloadData(data: SearchInRangeQuery.Data.SearchInRange) {
        self.dataObj = data
        dataSource = createDataSource()
    }
    private func createDataSource() -> Array<Array<CellDataProtocol>> {
        return [
            [RadarMapTableData()],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"),
                           rightCellProtocol: LRLabelCellData(labelText: self.dataObj.shopBranch?.shop?.title ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Style"),
                           rightCellProtocol: LRLabelCellData(labelText: (self.dataObj.shopBranch?.shop?.style ?? "") )),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Type"),
                           rightCellProtocol: LRLabelCellData(labelText: (self.dataObj.shopBranch?.shop?.type ?? "") )),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"),
                           rightCellProtocol: LRLabelCellData(labelText:
                            String(format: "%.2f", (self.dataObj.shopBranch?.shop?.underPrice ?? 0.0)!))),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"),
                rightCellProtocol: LRLabelCellData(labelText: "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"),
                           rightCellProtocol: LRRangeCellData(starDate: convertStringToUTC_ISO8601Date(dateString: (dataObj.shopBranch?.openTime ?? "")),
                                                              endDate: convertStringToUTC_ISO8601Date(dateString: (dataObj.shopBranch?.closedTime ?? "")))),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"),
                           rightCellProtocol: LRLabelCellData(labelText: (dataObj.shopBranch?.tel ?? "") )),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Address"),
                rightCellProtocol: LRLabelCellData(labelText: dataObj.completeInfo ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Test"),
                rightCellProtocol: LRLabelCellData(labelText: "Test"))
            ]
        ]
    }
}
