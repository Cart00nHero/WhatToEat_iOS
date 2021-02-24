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

struct CenterPoint {
    var coordinate: CLLocationCoordinate2D? = nil
    var zoomLevel = 16
    
}
class FindFoodScenario: Actor,PilotProtocol {
    
    private let pilot = Pilot(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
    private var centerPt = CenterPoint()
//    private var mapView: MKMapView? = nil
    private var lastQueryData = [SearchForRangeQuery.Data.SearchForRange?]()
    
    override init() {
        super.init()
        pilot.beRegisterSender(self)
        pilot.beRequestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
    }
    // MARK: - scenario actions
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
    private func _beUpdateCenterPoint(
        zoomLevel: Int,
        coordinate: CLLocationCoordinate2D?,
        _ complete: @escaping (CenterPoint) -> Void) {
        if zoomLevel > -1 {
            centerPt.zoomLevel = zoomLevel
        }
        if coordinate != nil {
            centerPt.coordinate = coordinate
        }
        complete(
            CenterPoint(
                coordinate: centerPt.coordinate,
                zoomLevel: centerPt.zoomLevel))
    }
    private func _beGetNewRegion(
        _ complete: @escaping (MKCoordinateRegion) -> Void) {
        if centerPt.coordinate != nil {
            let distance = regionDistance(zoomLevel: centerPt.zoomLevel)
            let region = MKCoordinateRegion(
                center: centerPt.coordinate!,
                latitudinalMeters: CLLocationDistance(distance),
                longitudinalMeters: CLLocationDistance(distance)
            )
            DispatchQueue.main.async {
                complete(region)
            }
        }
    }

    private func _beMoveMapCenterToCenterPoint(mapView: MKMapView) {
        MapNavigator(mapView: mapView)
            .beSetCenterCoordinate(coordinate: centerPt.coordinate!)
    }
    private func _beSearchInNewRange(mapCenter: CenterPoint) {
        var isNotified = false
        if !isNotified && centerPt.zoomLevel != mapCenter.zoomLevel {
            isNotified = true
            centerPt.zoomLevel = mapCenter.zoomLevel
            DispatchQueue.main.async {
                appStore.dispatch(SearchInNewRangeAction())
            }
            return
        }
        let searchingDistance = 1000*2*searchRange(zoomLevel: mapCenter.zoomLevel)
        pilot.beCalculateDistance(
            sender: self,
            from:centerPt.coordinate!,
            to: mapCenter.coordinate!) { [self] (distance) in
            if !isNotified && distance > searchingDistance {
                isNotified = true
                centerPt.coordinate = mapCenter.coordinate
                DispatchQueue.main.async {
                    appStore.dispatch(SearchInNewRangeAction())
                }
            }
        }
    }
    private func _beSearchNearby(mapCenter: CenterPoint) {
        let range = searchRange(zoomLevel: mapCenter.zoomLevel)
        let math = Mathematician()
        math.beCalculateRange(
            self, mapCenter.coordinate!, range) { (rangePt) in
            DispatchQueue.main.async {
                appStore.dispatch(searchForRangeAction(foodieId: globalFoodieId, min: rangePt.min, max: rangePt.max))
            }
        }
    }
    private func _beMarkFoundPlacesOnMap(
        queryData:[SearchForRangeQuery.Data.SearchForRange?]) {
        let annotations = NSMutableArray()
        for place in queryData {
            let latitude = Double(place!.latitude!) ?? 0.0
            let longitude = Double(place!.longitude!) ?? 0.0
            let location = CLLocation(latitude: latitude, longitude: longitude)
            let annotation = MKPointAnnotation()
            annotation.title = place?.completeInfo
            annotation.coordinate = location.coordinate
            annotations.add(annotation)
        }
        let markAnnotations = annotations as? [MKPointAnnotation] ?? []
        DispatchQueue.main.async {
            appStore.dispatch(
                MarkFoundPlacesOnMapAction(annotions: markAnnotations))
        }
    }
    private func _beDynamicQuerySelectedData(index: Int) {
        let data = lastQueryData[index]
        if data != nil {
            DataManager().beSearchRangeDataToLocDqCmd(sender: self, searchData: data!) { (addressDqCmd) in
                DispatchQueue.main.async {
                    appStore.dispatch(
                        locationsDynamicQueryAction(
                            foodieId: globalFoodieId, whereCMD: addressDqCmd))
                }
            }
        }
    }
    private func _beSendGourmetDetailParcel(
        content: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery){
        let recipientName = "GourmetDetailScenario"
//            String(describing: type(of: GourmetDetailScenario.self))
        _ = LogisticsCenter.shared.applyExpressService(sender: self, recipient: recipientName, content: content)
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
                DispatchQueue.main.async {
                    appStore.dispatch(
                        searchForRangeAction(foodieId: globalFoodieId, min: rangePt.min, max: rangePt.max))
                }
            }
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
    public func beUpdateCenterPoint(zoomLevel: Int, coordinate: CLLocationCoordinate2D?, _ complete: @escaping (CenterPoint) -> Void) -> Self {
        unsafeSend { self._beUpdateCenterPoint(zoomLevel: zoomLevel, coordinate: coordinate, complete) }
        return self
    }
    @discardableResult
    public func beGetNewRegion(_ complete: @escaping (MKCoordinateRegion) -> Void) -> Self {
        unsafeSend { self._beGetNewRegion(complete) }
        return self
    }
    @discardableResult
    public func beMoveMapCenterToCenterPoint(mapView: MKMapView) -> Self {
        unsafeSend { self._beMoveMapCenterToCenterPoint(mapView: mapView) }
        return self
    }
    @discardableResult
    public func beSearchInNewRange(mapCenter: CenterPoint) -> Self {
        unsafeSend { self._beSearchInNewRange(mapCenter: mapCenter) }
        return self
    }
    @discardableResult
    public func beSearchNearby(mapCenter: CenterPoint) -> Self {
        unsafeSend { self._beSearchNearby(mapCenter: mapCenter) }
        return self
    }
    @discardableResult
    public func beMarkFoundPlacesOnMap(queryData: [SearchForRangeQuery.Data.SearchForRange?]) -> Self {
        unsafeSend { self._beMarkFoundPlacesOnMap(queryData: queryData) }
        return self
    }
    @discardableResult
    public func beDynamicQuerySelectedData(index: Int) -> Self {
        unsafeSend { self._beDynamicQuerySelectedData(index: index) }
        return self
    }
    @discardableResult
    public func beSendGourmetDetailParcel(content: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) -> Self {
        unsafeSend { self._beSendGourmetDetailParcel(content: content) }
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
