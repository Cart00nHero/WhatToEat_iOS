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
            service.clearCache()
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
            appStore.dispatch(action)
        }
    }
    return action
}
