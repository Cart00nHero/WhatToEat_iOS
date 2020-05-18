//
//  AppState.swift
//  Beckon
//
//  Created by YuCheng on 2019/4/5.
//  Copyright © 2019 YuCheng. All rights reserved.
//

import ReSwift

struct AppState : StateType {
    let defaultTemplateState: DefaultTemplateState
}

// MARK: - SubStates
struct DefaultTemplateState : StateType {
    var subscriber: String
    let currentAction : Action?
}
