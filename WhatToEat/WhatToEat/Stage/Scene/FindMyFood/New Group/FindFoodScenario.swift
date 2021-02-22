//
//  FindFoodScenario.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/12.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn
import CoreLocation
import MapKit

struct FindFoodTableData {
    var dataObj: SearchForRangeQuery.Data.SearchForRange
    var dataSource: Array<TemplateProtocol> = []
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
            LRTemplate(leftViewItem: LabelItem(text: "Title"),
                           rightViewItem: LabelItem(text: self.dataObj.shopBranch?.shop?.title ?? "")),
            LRTemplate(leftViewItem: LabelItem(text: "Style"),
                           rightViewItem: LabelItem(text: (self.dataObj.shopBranch?.shop?.style ?? "") )),
            LRTemplate(leftViewItem: LabelItem(text: "Type"),
                           rightViewItem: LabelItem(text: (self.dataObj.shopBranch?.shop?.type ?? "") )),
            LRTemplate(leftViewItem: LabelItem(text: "Under\nPrice"),
                           rightViewItem: LabelItem(text:
                                                            String(format: "%.2f", (self.dataObj.shopBranch?.shop?.underPrice ?? 0.0)!))),
            LRTemplate(leftViewItem: LabelItem(text: "Name"),
                           rightViewItem: LabelItem(text: "")),
            LRTemplate(leftViewItem: LabelItem(text: "Tel"),
                           rightViewItem: LabelItem(text: (dataObj.shopBranch?.tel ?? "") )),
            LRTemplate(leftViewItem: LabelItem(text: "Address"),
                           rightViewItem: LabelItem(text: dataObj.completeInfo ?? "")),
            ButtonTemplate(cornerRadius: 2.0, titleText: "Navigation")
        ]
    }
}
struct CenterPoint {
    var coordinate: CLLocationCoordinate2D? = nil
    var zoomLevel = 17
    
}
class FindFoodScenario: Actor,PilotProtocol {
    
    private let pilot = Pilot(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
    private var centerPt = CenterPoint()
    private var mapView: MKMapView? = nil
    private var lastQueryData = [SearchForRangeQuery.Data.SearchForRange?]()
    
    override init() {
        super.init()
        pilot.beRegisterSender(self)
        pilot.beRequestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
    }
    // MARK: - scenario actions
    private func _beSetScenarioMap(map: MKMapView) {
        mapView = map
    }
    private func _beRequestCurrentLocation() {
        pilot.beRequestCurrentLocation()
    }
    private func _beStoreQueryData(
        queryData: [SearchForRangeQuery.Data.SearchForRange?]) {
        lastQueryData = queryData
    }
    private func _beGetQueryData(_ complete: @escaping ([SearchForRangeQuery.Data.SearchForRange?]) -> Void) {
        complete(lastQueryData)
    }
    private func _beGetQueryCount(_ complete: @escaping (Int) -> Void) {
        DispatchQueue.main.async { [self] in
            complete(lastQueryData.count)
        }
    }
    private func _beGetCenterPoint(_ complete: @escaping (CenterPoint) -> Void) {
        DispatchQueue.main.async { [self] in
            complete(centerPt)
        }
    }
    private func _beUpdateCenterPointZoomLevel(zoomLevel: Int) {
        centerPt.zoomLevel = zoomLevel
    }
    private func _beUpdateMapRegion(
        zoomLevel: Int, center: CLLocationCoordinate2D,
        _ complete: @escaping () -> Void) {
        if mapView != nil {
            let distance = regionDistance(zoomLevel: zoomLevel)
            MapNavigator(mapView: mapView!).beSetRegion(center, distance)
            DispatchQueue.main.async {
                complete()
            }
        }
    }
    private func _beMoveMapCenterToCenterPoint() {
        if mapView != nil && centerPt.coordinate != nil {
                MapNavigator(mapView: mapView!)
                    .beSetCenterCoordinate(coordinate: centerPt.coordinate!)
        }
    }
    private func _beSearchNearby() {
        if mapView != nil {
            MapNavigator(mapView: mapView!).beGetZoomLevel(sender: self) {
                [self] (zoomLevel) in
                let range = searchRange(zoomLevel: zoomLevel)
                let math = Mathematician()
                math.beCalculateRange(
                    self, mapView!.camera.centerCoordinate, range) { (rangePt) in
                    DispatchQueue.main.async {
                        appStore.dispatch(searchForRangeAction(foodieId: globalFoodieId, min: rangePt.min, max: rangePt.max))
                    }
                }
            }
        }
    }
    private func _beMarkFoundPlacesOnMap(
        queryData:[SearchForRangeQuery.Data.SearchForRange?]) {
        if mapView != nil {
            let annotations = NSMutableArray()
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
            let markAnnotations = annotations as? [MKPointAnnotation] ?? []
            let mapNav = MapNavigator(mapView: mapView!)
            mapNav.beRemoveAnnotations(sender: self, mapView!.annotations) {
                mapNav.beShowAnnotations(annotations: markAnnotations, animated: true)
            }
        }
    }
    private func _beSearchInNewRange() {
        if mapView == nil {
            return
        }
        MapNavigator(mapView: mapView!).beGetZoomLevel(sender: self) { [self] (zoomLevel) in
            var isNotified = false
            if !isNotified && centerPt.zoomLevel != zoomLevel {
                isNotified = true
                centerPt.zoomLevel = zoomLevel
                DispatchQueue.main.async {
                    appStore.dispatch(SearchInNewRangeAction())
                }
                return
            }
            let searchingDistance = 1000*2*searchRange(zoomLevel: zoomLevel)
            pilot.beCalculateDistance(sender: self, from: centerPt.coordinate!, to: mapView!.camera.centerCoordinate) { [self] (distance) in
                if !isNotified && distance > searchingDistance {
                    isNotified = true
                    clearApolloServiceCache()
                    centerPt.coordinate = mapView?.centerCoordinate
                    DispatchQueue.main.async {
                        appStore.dispatch(SearchInNewRangeAction())
                    }
                }
            }
        }
    }

    // MARK: - private
    private func searchRange(zoomLevel: Int) -> Float64 {
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
    // MARK: - Pilot protocols
    private func _beLocationManager(didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            centerPt.coordinate = locations.first?.coordinate
            let math = Mathematician()
            math.beCalculateRange(
                self, centerPt.coordinate!,
                searchRange(zoomLevel: centerPt.zoomLevel)) { (rangePt) in
                appStore.dispatch(searchForRangeAction(foodieId: globalFoodieId, min: rangePt.min, max: rangePt.max))
            }
            appStore.dispatch(LocatePositionAction(status: .DidUpdateLocation))
            
        }
    }
    
    private func _beLocationManager(didFailWithError error: Error) {
    }
    
    private func _beLocationManager(didChangeAuthorization status: CLAuthorizationStatus) {
    }
    
}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension FindFoodScenario {

    @discardableResult
    public func beSetScenarioMap(map: MKMapView) -> Self {
        unsafeSend { self._beSetScenarioMap(map: map) }
        return self
    }
    @discardableResult
    public func beRequestCurrentLocation() -> Self {
        unsafeSend(_beRequestCurrentLocation)
        return self
    }
    @discardableResult
    public func beStoreQueryData(queryData: [SearchForRangeQuery.Data.SearchForRange?]) -> Self {
        unsafeSend { self._beStoreQueryData(queryData: queryData) }
        return self
    }
    @discardableResult
    public func beGetQueryData(_ complete: @escaping ([SearchForRangeQuery.Data.SearchForRange?]) -> Void) -> Self {
        unsafeSend { self._beGetQueryData(complete) }
        return self
    }
    @discardableResult
    public func beGetQueryCount(_ complete: @escaping (Int) -> Void) -> Self {
        unsafeSend { self._beGetQueryCount(complete) }
        return self
    }
    @discardableResult
    public func beGetCenterPoint(_ complete: @escaping (CenterPoint) -> Void) -> Self {
        unsafeSend { self._beGetCenterPoint(complete) }
        return self
    }
    @discardableResult
    public func beUpdateCenterPointZoomLevel(zoomLevel: Int) -> Self {
        unsafeSend { self._beUpdateCenterPointZoomLevel(zoomLevel: zoomLevel) }
        return self
    }
    @discardableResult
    public func beUpdateMapRegion(zoomLevel: Int, center: CLLocationCoordinate2D, _ complete: @escaping () -> Void) -> Self {
        unsafeSend { self._beUpdateMapRegion(zoomLevel: zoomLevel, center: center, complete) }
        return self
    }
    @discardableResult
    public func beMoveMapCenterToCenterPoint() -> Self {
        unsafeSend(_beMoveMapCenterToCenterPoint)
        return self
    }
    @discardableResult
    public func beSearchNearby() -> Self {
        unsafeSend(_beSearchNearby)
        return self
    }
    @discardableResult
    public func beMarkFoundPlacesOnMap(queryData: [SearchForRangeQuery.Data.SearchForRange?]) -> Self {
        unsafeSend { self._beMarkFoundPlacesOnMap(queryData: queryData) }
        return self
    }
    @discardableResult
    public func beSearchInNewRange() -> Self {
        unsafeSend(_beSearchInNewRange)
        return self
    }
    @discardableResult
    public func beLocationManager(didUpdateLocations locations: [CLLocation]) -> Self {
        unsafeSend { self._beLocationManager(didUpdateLocations: locations) }
        return self
    }
    @discardableResult
    public func beLocationManager(didFailWithError error: Error) -> Self {
        unsafeSend { self._beLocationManager(didFailWithError: error) }
        return self
    }
    @discardableResult
    public func beLocationManager(didChangeAuthorization status: CLAuthorizationStatus) -> Self {
        unsafeSend { self._beLocationManager(didChangeAuthorization: status) }
        return self
    }

}
