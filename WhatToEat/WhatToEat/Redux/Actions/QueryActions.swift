//
//  QueryActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/6/8.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

struct LocationsDynamicQueryAction: Action, ApiActionProtocol {
    var status: ApiActionStatus = .Started
    var responseData:
        [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]?
    var queryData: DynamicQueryData<LocDynamicQueryData>?
    
}
func locationsDynamicQueryAction(whereCMD: AddressDqCmd) -> LocationsDynamicQueryAction {
    var action = LocationsDynamicQueryAction()
    let service = ApolloService.shared.apollo
    let query = LocationsDynamicQueryQuery(foodieId: nil, whereAnd: whereCMD)
    service.clearCache()
    service.fetch(query: query) { result in
        switch result {
        case .success(let gqlResult):
            if gqlResult.errors != nil {
                print(gqlResult.errors?.description ?? "")
                action.status = .Failed
            }
            if (gqlResult.data?.locationsDynamicQuery) != nil {
                action.responseData = gqlResult.data?.locationsDynamicQuery
                let serialized = try! JSONSerialization.data(withJSONObject: gqlResult.data?.jsonObject as Any, options: .prettyPrinted)
                do {
                    action.queryData =
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
func searchForRangeAction(
    foodieId: String?,
    min: InputCoordinate, max: InputCoordinate) -> SearchForRangeAction {
    var action = SearchForRangeAction()
    let service = ApolloService.shared.apollo
    var query:SearchForRangeQuery
    if foodieId == nil {
        query = SearchForRangeQuery(
            minCoordinate: min, maxCoordinate: max)
    } else {
        query = SearchForRangeQuery(
            foodieId: foodieId, minCoordinate: min, maxCoordinate: max)
    }
    service.clearCache()
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
    return action
}
struct ApolloClearCacheAction: Action {
    init() {
        clearCacheAction()
    }
    private func clearCacheAction() {
        let service = ApolloService.shared.apollo
        service.clearCache()
    }
}
struct GetReviewStatusAction: Action {
    var status: ApiActionStatus = .Started
    var responseData: GetReviewStatusResponse?
}

func getReviewStatusAction() -> GetReviewStatusAction {
    var action = GetReviewStatusAction()
    if NetWorkStatusListener.shareListener.isReachable == false {
        action.status = .Failed
        appStore.dispatch(action)
        return action
    }
    let request = GetReviewStatusRequest()
    httpBinNetwork.request(request) { (response) in
        if response.error == nil {
            switch response.httpURLResponse?.statusCode {
            case 200:
                action.status = .Success
                action.responseData =
                    response.decode(to: GetReviewStatusResponse.self)
                if !(action.responseData?.result ?? true) {
                    SingletonStorage.shared.apolloURL = "https://what2eat00no8.herokuapp.com/graphql/api"
                }
            case 404:
                action.status = .Failed
                SingletonStorage.shared.apolloURL = "https://what2eat00no8.herokuapp.com/graphql/api"
            default:
                action.status = .Failed
            }
            appStore.dispatch(action)
        }
    }
    return action
}
