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

struct CreateShopAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
}
func createShopAction(newShop: Shop) -> CreateShopAction {
    
    var action = CreateShopAction()
    let service = ApolloService.shared.apollo
    let branch = parseShopGraphQLData(branch: newShop.branches[0])
    let createShopMutation =  CreateShopMutation(title: newShop.title ?? "",
                                                 style: newShop.style, type: newShop.type,
                                                 underPrice: newShop.underPrice, branches: [branch])
    service.perform(mutation: createShopMutation){result in
        
        switch result {
        case .success(let graphQLResult):
            if (graphQLResult.data?.createShop) != nil {
                action.status = .Success
            }
            if graphQLResult.errors != nil {
                print("幹咧！！")
                print(graphQLResult.errors?.description ?? "")
                action.status = .Failed
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
        }
        appStore.dispatch(action)
    }
    
    return action
}
