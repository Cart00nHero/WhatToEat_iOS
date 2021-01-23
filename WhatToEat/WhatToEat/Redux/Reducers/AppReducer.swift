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
        deliveryState: deliveryReducer(action: action, state: state?.deliveryState),
        sceneState: sceneStateReducer(action: action, state: state?.sceneState)
    )
}

// MARK: - SubReducers
func sceneStateReducer(action: Action, state: SceneState?) -> SceneState {
    var newState = SceneState(currentAction: action, receivedParcel: state?.receivedParcel)
    switch newState.currentAction {
    case is SendParcelAction:
        let action = newState.currentAction as? SendParcelAction
        newState.receivedParcel = action?.parcel
    case is SignParcelReceiptAction:
        newState.receivedParcel = nil
    default:break;
    }
    return newState
}

func deliveryReducer(action: Action, state: DeliveryState?) -> DeliveryState {
    return DeliveryState(currentAction: action)
}
