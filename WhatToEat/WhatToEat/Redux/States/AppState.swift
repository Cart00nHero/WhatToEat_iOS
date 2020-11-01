//
//  AppState.swift
//  Beckon
//
//  Created by YuCheng on 2019/4/5.
//  Copyright © 2019 YuCheng. All rights reserved.
//

import ReSwift

struct AppState : StateType {
    let deliveryState: DeliveryState
    let defaultTemplateState: DefaultTemplateState
}

// MARK: - SubStates
struct DefaultTemplateState : StateType {
    let currentAction : Action?
    var receivedParcel: DeliveryMan.ParcelObject?
}

struct DeliveryState {
    let currentAction : Action?
}
