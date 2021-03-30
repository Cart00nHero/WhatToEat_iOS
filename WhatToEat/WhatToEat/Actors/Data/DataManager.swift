//
//  DataManager.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/13.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import Flynn
import CoreLocation
import MapKit

class DataManager: Actor {
    private func _beConvertPlaceMarksToInputAddresses(
        _ sender: Actor,_ placeMarks:[CLPlacemark],
        _ complete: @escaping ([InputAddress]) -> Void) {
        var result: [InputAddress] = []
        for placeMark in placeMarks {
            var newAddress = initInputAddress()
            newAddress.latitude = String(format: "%f", placeMark.location?.coordinate.latitude ?? 0.0)
            newAddress.longitude = String(format: "%f", placeMark.location?.coordinate.longitude ?? 0.0)
            newAddress.nation = placeMark.country ?? ""
            newAddress.isoNationCode = placeMark.isoCountryCode ?? ""
            newAddress.locality = placeMark.locality ?? ""
            newAddress.subLocality = placeMark.subLocality ?? ""
            newAddress.administrativeArea = placeMark.administrativeArea ?? ""
            newAddress.subAdministrativeArea = placeMark.subAdministrativeArea ?? ""
            newAddress.postalCode = placeMark.postalCode
            newAddress.thoroughfare = placeMark.thoroughfare ?? ""
            newAddress.subThoroughfare = placeMark.subThoroughfare ?? ""
            newAddress.completeInfo = combineAddressCompleteInfo(input: newAddress)
            result.append(newAddress)
        }
        sender.unsafeSend {
            complete(result)
        }
    }
    private func _beConvertPlaceMarkToAddressDqCmd(
        _ sender: Actor,_ placeMark: CLPlacemark,
        _ complete: @escaping (AddressDqCmd) -> Void) {
        var addressDqCmd = AddressDqCmd()
        if placeMark.country != nil {
            addressDqCmd.nation = placeMark.country
        }
        if placeMark.isoCountryCode != nil {
            addressDqCmd.isoNationCode = placeMark.isoCountryCode
        }
        if placeMark.locality != nil {
            addressDqCmd.locality = placeMark.locality
        }
        if placeMark.subLocality != nil {
            addressDqCmd.subLocality = placeMark.subLocality
        }
        if placeMark.administrativeArea != nil {
            addressDqCmd.administrativeArea = placeMark.administrativeArea
        }
        if placeMark.subAdministrativeArea != nil {
            addressDqCmd.subAdministrativeArea = placeMark.subAdministrativeArea
        }
        if placeMark.postalCode != nil {
            addressDqCmd.postalCode = placeMark.postalCode
        }
        if placeMark.thoroughfare != nil {
            addressDqCmd.thoroughfare = placeMark.thoroughfare
        }
        if placeMark.subThoroughfare != nil {
            addressDqCmd.subThoroughfare = placeMark.subThoroughfare
        }
        sender.unsafeSend {
            complete(addressDqCmd)
        }
    }
    private func _beConvertLocDQDataToGQInput(
        _ sender: Actor,
        _ queryData:[LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?],
        _ complete:@escaping ([GQInputObject]) -> Void) {
        if queryData.count > 0 {
            var results = [GQInputObject]()
            for data in queryData {
                let inputObj = locDQToGQInputObj(result: data!)
                results.append(inputObj)
            }
            sender.unsafeSend {
                complete(results)
            }
        }
    }
    private func _beSearchRangeDataToLocDqCmd(
        sender: Actor,
        searchData: SearchForRangeQuery.Data.SearchForRange,
        _ complete: @escaping (AddressDqCmd) -> Void) {
        var addressCmd = AddressDqCmd()
        if searchData.nation != nil {
            addressCmd.nation = searchData.nation
        }
        if searchData.isoNationCode != nil {
            addressCmd.isoNationCode = searchData.isoNationCode
        }
        if searchData.locality != nil {
            addressCmd.locality = searchData.locality
        }
        if searchData.subLocality != nil {
            addressCmd.subLocality = searchData.subLocality
        }
        if searchData.administrativeArea != nil {
            addressCmd.administrativeArea =
                searchData.administrativeArea
        }
        if searchData.subAdministrativeArea != nil {
            addressCmd.subAdministrativeArea =
                searchData.subAdministrativeArea
        }
        if searchData.postalCode != nil {
            addressCmd.postalCode = searchData.postalCode
        }
        if searchData.thoroughfare != nil {
            addressCmd.thoroughfare = searchData.thoroughfare
        }
        if searchData.subThoroughfare != nil {
            addressCmd.subThoroughfare = searchData.subThoroughfare
        }
        sender.unsafeSend {
            complete(addressCmd)
        }
    }
    
    // MARK: - Private
    private func combineAddressCompleteInfo(input: InputAddress) -> String {
        let mutabletext = NSMutableString(string: input.administrativeArea)
        mutabletext.append(" ")
        mutabletext.append(input.subAdministrativeArea)
        mutabletext.append(" ")
        mutabletext.append(input.locality)
        mutabletext.append(" ")
        mutabletext.append(input.thoroughfare)
        mutabletext.append(" ")
        mutabletext.append(input.subThoroughfare)
        return mutabletext as String
    }
}

// MARK: - Autogenerated by FlynnLint
// Contents of file after this marker will be overwritten as needed

extension DataManager {

    @discardableResult
    public func beConvertPlaceMarksToInputAddresses(_ sender: Actor, _ placeMarks: [CLPlacemark], _ complete: @escaping ([InputAddress]) -> Void) -> Self {
        unsafeSend { self._beConvertPlaceMarksToInputAddresses(sender, placeMarks, complete) }
        return self
    }
    @discardableResult
    public func beConvertPlaceMarkToAddressDqCmd(_ sender: Actor, _ placeMark: CLPlacemark, _ complete: @escaping (AddressDqCmd) -> Void) -> Self {
        unsafeSend { self._beConvertPlaceMarkToAddressDqCmd(sender, placeMark, complete) }
        return self
    }
    @discardableResult
    public func beConvertLocDQDataToGQInput(_ sender: Actor, _ queryData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?], _ complete: @escaping ([GQInputObject]) -> Void) -> Self {
        unsafeSend { self._beConvertLocDQDataToGQInput(sender, queryData, complete) }
        return self
    }
    @discardableResult
    public func beSearchRangeDataToLocDqCmd(sender: Actor, searchData: SearchForRangeQuery.Data.SearchForRange, _ complete: @escaping (AddressDqCmd) -> Void) -> Self {
        unsafeSend { self._beSearchRangeDataToLocDqCmd(sender: sender, searchData: searchData, complete) }
        return self
    }

}
