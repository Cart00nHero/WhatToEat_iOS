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

class SearchLocScenario: Actor {
    
    enum SearchMode {
        case Map, Google
    }
    
    private let pilot = Pilot(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
    private var queryDataParcel: Parcel?
    private var markedGQInput = initGQInputObject()
    
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
                        beInquireIntoLocationsAddress(
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
                    DataManager().beConvertPlaceMarksToInputAddresses(
                        self, placemarks!) { [self] (result) in
                        if result.count > 0 {
                            var inputObj = initGQInputObject()
                            inputObj.address = result.first!
                            if localeId.isEmpty {
                                // get localized address
                                beInquireIntoAddressesLocation(address: inputObj.address.completeInfo)
                            } else {
                                markedGQInput = inputObj
                                action.inputObj = inputObj
                                DispatchQueue.main.async {
                                    appStore.dispatch(action)
                                }
                            }
                        }
                    }
                    if !localeId.isEmpty {
                        DataManager().beConvertPlaceMarkToAddressDqCmd(
                            self, placemarks![0]) { (addressDqCmd) in
                            DispatchQueue.main.async {
                                appStore.dispatch(
                                    locationsDynamicQueryAction(whereCMD: addressDqCmd))
                            }
                        }
                    }
                }
            }
        }
    }
    private func _beGetQueryDataMarkers(
        queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?],
        _ complete: @escaping ([MKPointAnnotation]) -> Void) {
        DataManager().beConvertLocDQDataToGQInput(self, queryData) { [self]
            (inputObjs) in
            if inputObjs.count > 0 {
                queryDataParcel =
                    LogisticsCenter.shared.applyExpressService(sender: self, recipient: "FoundLocScenario", content: inputObjs)
                let data = inputObjs.first!
                let latitude = Double(data.address.latitude) ?? 0.0
                let longitude = Double(data.address.longitude) ?? 0.0
                let location = CLLocation(latitude: latitude, longitude: longitude)
                let annotation = MKPointAnnotation()
                annotation.title = "點我前進下一頁"
                annotation.coordinate = location.coordinate
                DispatchQueue.main.async {
                    complete([annotation])
                }
            }
        }
    }
    private func _beGetFoundPlacesMarkers(
        _ complete: @escaping ([MKPointAnnotation]) -> Void) {
        let latitude = Double(markedGQInput.address.latitude) ?? 0.0
        let longitude = Double(markedGQInput.address.longitude) ?? 0.0
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.title = "點我前進下一頁"
        annotation.coordinate = location.coordinate
        DispatchQueue.main.async {
            complete([annotation])
        }
    }
    
    private func _bePrepareGoFoundLocScenario(
        _ complete: @escaping (Bool) -> Void) {
        var isPrepared = false
        if queryDataParcel != nil {
            queryDataParcel = nil
            isPrepared = true
        } else {
            _ = LogisticsCenter.shared.applyExpressService(
                sender: self, recipient: "AddGourmetScenario",
                content: markedGQInput)
        }
        DispatchQueue.main.async {
            complete(isPrepared)
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
        image: UIImage, _ complete: @escaping (UIImage) -> Void) {
        ToolMan().beResizeImage(
            sender: self, image: image, width: 44.0) { (newImage) in
            DispatchQueue.main.async {
                complete(newImage)
            }
        }
    }
    private func _beStopPilot() {
        pilot.beStop()
    }
}
// MARK: - Pilot protocols
extension SearchLocScenario: PilotProtocol {
    private func _beLocationManager(didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            beInquireIntoLocationsAddress(
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
    public func beGetQueryDataMarkers(queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?], _ complete: @escaping ([MKPointAnnotation]) -> Void) -> Self {
        unsafeSend { self._beGetQueryDataMarkers(queryData: queryData, complete) }
        return self
    }
    @discardableResult
    public func beGetFoundPlacesMarkers(_ complete: @escaping ([MKPointAnnotation]) -> Void) -> Self {
        unsafeSend { self._beGetFoundPlacesMarkers(complete) }
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
    public func beResizeBarButtonItemImage(image: UIImage, _ complete: @escaping (UIImage) -> Void) -> Self {
        unsafeSend { self._beResizeBarButtonItemImage(image: image, complete) }
        return self
    }
    @discardableResult
    public func beStopPilot() -> Self {
        unsafeSend(_beStopPilot)
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
