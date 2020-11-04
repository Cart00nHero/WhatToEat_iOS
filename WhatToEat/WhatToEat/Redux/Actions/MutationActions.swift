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

struct CreateOwnGourmetAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func createOwnGourmetAction(inputObj: GQInputObject) -> CreateOwnGourmetAction {
    var action = CreateOwnGourmetAction()
    let service = ApolloService.shared.apollo
    let mutation = CreateOwnGourmetMutation(foodieId: "", address: inputObj.address, shopBranch: inputObj.shopBranch, shop: inputObj.shop)
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
struct UpdateGroumetAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func updateGroumetAction(inputObj: GQInputObject) -> UpdateGroumetAction {
    var action = UpdateGroumetAction()
    let service = ApolloService.shared.apollo
    let mutation = UpdateGroumetMutation(branchId: inputObj.branchId, branch: inputObj.shopBranch,shop: inputObj.shop,address: inputObj.address)
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
