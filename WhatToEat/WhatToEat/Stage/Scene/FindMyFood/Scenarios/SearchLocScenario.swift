//
//  SearchLocScenario.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/13.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn
import CoreLocation
import MapKit

class SearchLocScenario: Actor,PilotProtocol {
    
    enum SearchMode {
        case Map, Google
    }
    
    private let pilot = Pilot(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
    private var locParcel = Parcel(content: "")
    private var mapView: MKMapView? = nil
    private var foundGQInputs = [GQInputObject]()
    
    override init() {
        super.init()
//        pilot.beRegisterSender(self)
        pilot.beRequestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
    }
    
    // MARK: - scenario actions
    private func _beGoogleSearchUrl(
        _ queryText: String, _ complete: @escaping (String) -> Void) {
        let query = queryText.replacingOccurrences(of: " ", with: "+")
        let url = "https://www.google.co.in/search?q=" + query
        complete(url)
    }
    private func _beSetScenarioMap(map: MKMapView) {
        mapView = map
    }
    private func _beRequestCurrentLocation() {
        pilot.beRequestCurrentLocation()
    }
    private func _beInquireIntoAddressesLocation(address: String) {
        GeoCoder().beCodeAddress(self, address) { (placemarks, error) in
        }
    }
    private func _beInquireIntoLocationsAddress(location: CLLocation) {
        var action = FoundLocationsAddressAction()
        GeoCoder().beReverseLocation(self, location: location) { (placemarks, error) in
            if error == nil {
                if placemarks?.count ?? 0 > 0 {
                    DataManager().beParsePlaceMarktoGQInput(self, placemarks!) {
                        [self] (inputObjs) in
                        if inputObjs.count > 0 {
                            action.inputObj = inputObjs.first!
                            foundGQInputs = inputObjs
                        }
                    }
                    DataManager().beParsePlaceMarkToAddressDqCmd(self, placemarks![0]) { (addressDqCmd) in
                        appStore.dispatch(
                            locationsDynamicQueryAction(whereCMD: addressDqCmd))
                    }
                }
            }
        }
    }
    private func _beMarkQueryDataOnMap(
        queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]) {
        DataManager().beParseLocDynamicQueryDataToGQInput(self, queryData) { [self]
            (inputObjs) in
            if mapView != nil && inputObjs.count > 0 {
                foundGQInputs = inputObjs
                var annotations = [MKPointAnnotation]()
                for address in inputObjs {
                    let latitude = Double(address.address.latitude) ?? 0.0
                    let longitude = Double(address.address.longitude) ?? 0.0
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let annotation = MKPointAnnotation()
                    annotation.title = address.shop.title
                    annotation.subtitle = address.shopBranch.name
                    annotation.coordinate = location.coordinate
                    annotations.append(annotation)
                }
                MapNavigator(mapView: mapView!).beShowAnnotations(
                    annotations: annotations, animated: true)
            }
        }
    }
    private func _beMarkFoundPlacesOnMap() {
        if mapView != nil && foundGQInputs.count > 0 {
            var annotations = [MKPointAnnotation]()
            for address in foundGQInputs {
                let latitude = Double(address.address.latitude) ?? 0.0
                let longitude = Double(address.address.longitude) ?? 0.0
                let location = CLLocation(latitude: latitude, longitude: longitude)
                let annotation = MKPointAnnotation()
                annotation.title = address.shop.title
                annotation.subtitle = address.shopBranch.name
                annotation.coordinate = location.coordinate
                annotations.append(annotation)
            }
            MapNavigator(mapView: mapView!).beShowAnnotations(
                annotations: annotations, animated: true)
        }
    }
    
    // MARK: - Pilot protocols
    private func _beLocationManager(didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            beInquireIntoLocationsAddress(location: locations[0])
            if mapView != nil {
                let markLoc = locations[0]
                let annotation = MKPointAnnotation()
                annotation.coordinate = markLoc.coordinate
                MapNavigator(mapView: mapView!).beShowAnnotations(annotations: [annotation], animated: true)
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

extension SearchLocScenario {

    @discardableResult
    public func beGoogleSearchUrl(_ queryText: String, _ complete: @escaping (String) -> Void) -> Self {
        unsafeSend { self._beGoogleSearchUrl(queryText, complete) }
        return self
    }
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
    public func beInquireIntoAddressesLocation(address: String) -> Self {
        unsafeSend { self._beInquireIntoAddressesLocation(address: address) }
        return self
    }
    @discardableResult
    public func beInquireIntoLocationsAddress(location: CLLocation) -> Self {
        unsafeSend { self._beInquireIntoLocationsAddress(location: location) }
        return self
    }
    @discardableResult
    public func beMarkQueryDataOnMap(queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]) -> Self {
        unsafeSend { self._beMarkQueryDataOnMap(queryData: queryData) }
        return self
    }
    @discardableResult
    public func beMarkFoundPlacesOnMap() -> Self {
        unsafeSend(_beMarkFoundPlacesOnMap)
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
