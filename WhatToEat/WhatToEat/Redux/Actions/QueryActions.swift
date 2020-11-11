//
//  QueryActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/8.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

struct FoodiesDynamicQueryAction: Action,ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData: [FoodiesDynamicQueryQuery.Data.FoodiesDynamicQuery?]?
}

func foodiesDynamicQueryAction(whereCMD: FoodieDqCmd) -> FoodiesDynamicQueryAction {
    var action = FoodiesDynamicQueryAction()
    let service = ApolloService.shared.apollo
    let query = FoodiesDynamicQueryQuery(whereAnd: whereCMD)
    service.fetch(query: query){ result in
        switch result {
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                action.status = .Success
                action.responseData = graphQLResult.data?.foodiesDynamicQuery
                action.status = .Success
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    
    return action
}
struct LocationsDynamicQueryAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData: [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]?
    var dynamicQueryData: DynamicQueryData<LocDynamicQueryData>?
    
}
func locationsDynamicQueryAction(whereCMD: AddressDqCmd) -> LocationsDynamicQueryAction {
    var action = LocationsDynamicQueryAction()
    let service = ApolloService.shared.apollo
    let query = LocationsDynamicQueryQuery(whereAnd: whereCMD)
    service.fetch(query: query) { result in
        switch result {
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                print(graphQLResult.errors?.description ?? "")
                action.status = .Failed
            }
            if (graphQLResult.data?.locationsDynamicQuery) != nil {
                action.responseData = graphQLResult.data?.locationsDynamicQuery
                let serialized = try! JSONSerialization.data(withJSONObject: graphQLResult.data?.jsonObject as Any, options: .prettyPrinted)
//                let deserialized = try! JSONSerialization.jsonObject(with: serialized, options: []) as! [String: Any]
                do {
                    action.dynamicQueryData =
                        try JSONDecoder().decode(DynamicQueryData<LocDynamicQueryData>.self, from: serialized)
                } catch {
                    print(error)
                }
                action.status = .Success
            }
            appStore.dispatch(action)
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    return action
}
struct SearchForRangeAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData: [SearchForRangeQuery.Data.SearchForRange?]?
}
func searchForRangeAction(foodieId: String?,min: InputCoordinate, max: InputCoordinate) -> SearchForRangeAction {
    var action = SearchForRangeAction()
    let service = ApolloService.shared.apollo
    let query = SearchForRangeQuery(foodieId: foodieId, minCoordinate: min, maxCoordinate: max)
    service.fetch(query: query) { result in
        switch result {
        case .success(let graphQLResult):
            if graphQLResult.errors != nil {
                print(graphQLResult.errors?.description ?? "")
                action.status = .Failed
                appStore.dispatch(action)
                return
            }
            if graphQLResult.data?.searchForRange != nil {
                action.status = .Success
                action.responseData = graphQLResult.data?.searchForRange
            } else {
                action.status = .Failed
            }
            appStore.dispatch(action)
            
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    service.clearCache()
    return action
}
struct ApolloServiceClearCacheAction: Action {
    init() {
        clearCacheAction()
    }
    private func clearCacheAction() {
        let service = ApolloService.shared.apollo
        service.clearCache()
    }
}
