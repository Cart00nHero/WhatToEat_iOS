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
}
func locationsDynamicQueryAction(whereCMD: InputAddress) -> LocationsDynamicQueryAction {
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
                graphQLResult.data?.jsonObject
//                let data = try JSONSerialization.data(withJSONObject: graphQLResult.data.jsonObject, options: .allowFragments)
//                let decode:LaunchesModal = try JSONDecoder().decode(LaunchesModal.self, from: data)
                action.status = .Success
            }
        case .failure(let error):
            print(error.localizedDescription)
            action.status = .Failed
        }
    }
    return action
}
