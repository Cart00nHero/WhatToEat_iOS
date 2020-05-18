//
//  AppReducer.swift
//  Beckon
//
//  Created by YuCheng on 2019/4/5.
//  Copyright © 2019 YuCheng. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        defaultTemplateState: defaultTemplateReducer(action: action, state: state?.defaultTemplateState)
    )
}

// MARK: - SubReducers
func defaultTemplateReducer(action: Action, state: DefaultTemplateState?) -> DefaultTemplateState {
    var newState = DefaultTemplateState(subscriber: state?.subscriber ?? "", currentAction: action)
    if let currentAction = action as? RegisterStateAction {
        newState.subscriber = currentAction.subscriber
    }
    return newState
}
