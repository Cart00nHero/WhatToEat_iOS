//
//  ApiActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/31.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

enum ApiActionStatus {
    case Started, Success, Failed
}
protocol ApiActionProtocol {
    var status: ApiActionStatus { get set }
}

struct CreateLocationAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func createLocationAction(newLoc: GQAddress) -> CreateLocationAction {
    var action = CreateLocationAction()
    let service = ApolloService.shared.apollo
    let createLocationMutation = CreateLocationMutation(ownerType: newLoc.ownerType, completeInfo: newLoc.completeInfo, fullInfo: newLoc.fullInfo, postalCode: newLoc.postalCode, nation: newLoc.nation, isoNationCode: newLoc.isoNationCode, locality: newLoc.locality, subLocality: newLoc.subLocality, administrativeArea: newLoc.administrativeArea, subAdministrativeArea: newLoc.subAdministrativeArea, thoroughfare: newLoc.thoroughfare, subThoroughfare: newLoc.subThoroughfare, floor: newLoc.floor, latitude: String(format:"%f", newLoc.latitude), longitude: String(format:"%f", newLoc.longitude), annotation: newLoc.annotation, shopBranch: newLoc.shopBranch)
    service.perform(mutation: createLocationMutation) { result in
        switch result {
            
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                print("幹咧！！")
                print(graphQLResult.errors?.description ?? "")
                action.status = .Failed
            }
            if (graphQLResult.data?.createLocation) != nil {
                action.status = .Success
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
        }
        appStore.dispatch(action)
    }
    return action
}
