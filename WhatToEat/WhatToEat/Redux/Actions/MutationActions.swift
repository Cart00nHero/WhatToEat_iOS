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
struct CreateFoodieAction: Action,ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData: CreateFoodieMutation.Data.CreateFoodie?
}
func createFoodieAction(email: String,name: String,gender: Int, token: InputToken) -> CreateFoodieAction {
    var action = CreateFoodieAction()
    let service = ApolloService.shared.apollo
    let mutation = CreateFoodieMutation(email: email, name: name, token: token)
    service.perform(mutation: mutation) { result in
        switch result {
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                action.status = .Failed
                action.responseData = graphQLResult.data?.createFoodie
            } else {
                action.status = .Success
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
        }
    }
    return action
}
struct CreateGourmetAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func createGourmetAction(foodieId: String?,inputObj: GQInputObject) -> CreateGourmetAction {
    var action = CreateGourmetAction()
    let service = ApolloService.shared.apollo
    let mutation = CreateGourmetMutation(foodieId: foodieId ?? "", address: inputObj.address, shopBranch: inputObj.shopBranch, shop: inputObj.shop)
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
