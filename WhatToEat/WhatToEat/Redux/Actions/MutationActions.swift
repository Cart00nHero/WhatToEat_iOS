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

struct SignFoodieAction: Action,ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData: SignFoodieMutation.Data.SignFoodie?
}
func signFoodieAction(signData: SignData) -> SignFoodieAction {
    var action = SignFoodieAction()
    let service = ApolloService.shared.apollo
    let mutation = SignFoodieMutation(signData: signData)
    service.perform(mutation: mutation){ result in
        switch result {
        
        case .success(let gqlResult):
            if gqlResult.errors != nil {
                action.status = .Failed
            } else {
                action.status = .Success
                action.responseData = gqlResult.data?.signFoodie
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
        }
        appStore.dispatch(action)
    }
    return action
}
struct CreateGourmetAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func createGourmetAction(foodieId: String,inputObj: GQInputObject) -> CreateGourmetAction {
    var action = CreateGourmetAction()
    let service = ApolloService.shared.apollo
    let mutation = CreateGourmetMutation(foodieId: foodieId , address: inputObj.address, shopBranch: inputObj.shopBranch, shop: inputObj.shop)
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
func updateGroumetAction(foodieId: String,inputObj: GQInputObject) -> UpdateGroumetAction {
    var action = UpdateGroumetAction()
    let service = ApolloService.shared.apollo
    let mutation = UpdateGroumetMutation(
        foodieId: foodieId,branchId: inputObj.branchId, branch: inputObj.shopBranch,shop: inputObj.shop,address: inputObj.address)
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

struct DislikeGourmetAction: Action,ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func dislikeGourmetAction(foodieId: String, branchId: String) -> DislikeGourmetAction {
    var action = DislikeGourmetAction()
    let service = ApolloService.shared.apollo
    let mutation = DislikeGourmetMutation(foodieId: foodieId, branchId: branchId)
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
    }
    return action
}
