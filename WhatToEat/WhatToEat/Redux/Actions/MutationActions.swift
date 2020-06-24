//
//  MutationActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/8.
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
    let mutation = CreateLocationMutation(address: newLoc.address, shopBranch: newLoc.shopBranch, shop: newLoc.shop)
    service.perform(mutation: mutation) { result in
        switch result {
            
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                action.status = .Failed
            } else {
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
