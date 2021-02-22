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
    return SceneState(currentAction: action)
}

func deliveryReducer(action: Action, state: DeliveryState?) -> DeliveryState {
    return DeliveryState(currentAction: action)
}
