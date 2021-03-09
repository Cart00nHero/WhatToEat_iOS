//
//  SearchLocScenario.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/13.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn
import ReSwift
import CoreLocation
import MapKit

class SearchLocScenario: Actor,PilotProtocol {
    
    enum SearchMode {
        case Map, Google
    }
    
    private let pilot = Pilot(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
    private var queryDataParcel: Parcel?
    private var markedGQinput = initGQInputObject()
    
    override init() {
        super.init()
        pilot.beRegisterSender(self)
        pilot.beRequestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
    }
    
    // MARK: - scenario actions
    private func _beGoogleSearchUrl(
        _ queryText: String, _ complete: @escaping (String) -> Void) {
        let query = queryText.replacingOccurrences(of: " ", with: "+")
        let url = "https://www.google.co.in/search?q=" + query
        DispatchQueue.main.async {
            complete(url)
        }
    }
    
    private func _beRequestCurrentLocation() {
        pilot.beRequestCurrentLocation()
    }
    private func _beInquireIntoAddressesLocation(address: String) {
        GeoCoder().beCodeAddress(sender: self, address: address) { [self]
            (placemarks, error) in
            if placemarks?.count ?? 0 > 0 {
                DispatchQueue.main.async {
                    appStore.dispatch(MapRemoveAllAnnotationsAction())
                    unsafeSend {
                        let location = placemarks?.first?.location
                        let isoCode = placemarks?.first?.isoCountryCode ?? ""
                        _beInquireIntoLocationsAddress(
                            location: location!,
                            localeId: isoNationCodeToLocaleId(isoCode: isoCode))
                    }
                }
            }
        }
    }
    private func _beInquireIntoLocationsAddress(
        location: CLLocation,localeId: String) {
        var action = FoundLocationsAddressAction()
        GeoCoder().beLocalizedReverseLocation(
            sender: self, location: location,
            localeId: localeId) { (placemarks, error) in
            if error == nil {
                if placemarks?.count ?? 0 > 0 {
                    DataManager().beConvertPlaceMarkToGQInput(self, placemarks!) {
                        [self] (inputObjs) in
                        if inputObjs.count > 0 {
                            markedGQinput = inputObjs.first!
                            action.inputObj = markedGQinput
                            DispatchQueue.main.async {
                                appStore.dispatch(action)
                            }
                        }
                    }
                    DataManager().beConvertPlaceMarkToAddressDqCmd(
                        self, placemarks![0]) { (addressDqCmd) in
                        DispatchQueue.main.async {
                            appStore.dispatch(
                                locationsDynamicQueryAction(
                                    foodieId: nil, whereCMD: addressDqCmd))
                        }
                    }
                }
            }
        }
    }
    private func _beGetMarkQueryData(
        queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?],
        _ complete: @escaping ([MKPointAnnotation]) -> Void) {
        DataManager().beConvertLocDynamicQueryDataToGQInput(self, queryData) { [self]
            (inputObjs) in
            queryDataParcel = LogisticsCenter.shared.applyExpressService(sender: self, recipient: "FoundLocScenario", content: inputObjs)
            if inputObjs.count > 0 {
                let data = inputObjs.first!
                var annotations = [MKPointAnnotation]()
                let latitude = Double(data.address.latitude) ?? 0.0
                let longitude = Double(data.address.longitude) ?? 0.0
                let location = CLLocation(latitude: latitude, longitude: longitude)
                let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotations.append(annotation)
                DispatchQueue.main.async {
                    complete(annotations)
                }
            }
        }
    }
    private func _beGetMarkFoundPlaces(
        _ complete: @escaping ([MKPointAnnotation]) -> Void) {
        var annotations = [MKPointAnnotation]()
        let latitude = Double(markedGQinput.address.latitude) ?? 0.0
        let longitude = Double(markedGQinput.address.longitude) ?? 0.0
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotations.append(annotation)
        DispatchQueue.main.async {
            complete(annotations)
        }
    }
    
    private func _bePrepareGoFoundLocScenario(_ complete: @escaping (Bool) -> Void) {
        var isPreapared = false
        if queryDataParcel != nil {
            queryDataParcel = nil
            isPreapared = true
        } else {
            _ = LogisticsCenter.shared.applyExpressService(
                sender: self, recipient: "AddGourmetScenario",
                content: markedGQinput)
        }
        DispatchQueue.main.async {
            complete(isPreapared)
        }
    }
    private func _beCancelFoundLocParcel() {
        if queryDataParcel != nil {
            LogisticsCenter.shared.cancelService(
                recipient: "FoundLocScenario", parcel: queryDataParcel!)
            queryDataParcel = nil
        }
    }
    private func _beResizeBarButtonItemImage(
        image: UIImage, width: CGFloat, _ complete: @escaping (UIImage) -> Void) {
        ToolMan().beResizeImage(
            sender: self, image: image, width: width) { (newImage) in
            DispatchQueue.main.async {
                complete(newImage)
            }
        }
    }
    
    // MARK: - Pilot protocols
    private func _beLocationManager(didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            _beInquireIntoLocationsAddress(
                location: locations[0], localeId: "")
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
    public func beInquireIntoLocationsAddress(location: CLLocation, localeId: String) -> Self {
        unsafeSend { self._beInquireIntoLocationsAddress(location: location, localeId: localeId) }
        return self
    }
    @discardableResult
    public func beGetMarkQueryData(queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?], _ complete: @escaping ([MKPointAnnotation]) -> Void) -> Self {
        unsafeSend { self._beGetMarkQueryData(queryData: queryData, complete) }
        return self
    }
    @discardableResult
    public func beGetMarkFoundPlaces(_ complete: @escaping ([MKPointAnnotation]) -> Void) -> Self {
        unsafeSend { self._beGetMarkFoundPlaces(complete) }
        return self
    }
    @discardableResult
    public func bePrepareGoFoundLocScenario(_ complete: @escaping (Bool) -> Void) -> Self {
        unsafeSend { self._bePrepareGoFoundLocScenario(complete) }
        return self
    }
    @discardableResult
    public func beCancelFoundLocParcel() -> Self {
        unsafeSend(_beCancelFoundLocParcel)
        return self
    }
    @discardableResult
    public func beResizeBarButtonItemImage(image: UIImage, width: CGFloat, _ complete: @escaping (UIImage) -> Void) -> Self {
        unsafeSend { self._beResizeBarButtonItemImage(image: image, width: width, complete) }
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
