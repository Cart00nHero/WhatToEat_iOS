//
//  SignActions.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import FacebookLogin

enum LoginActionStatus {
    case Started, Success, Cancelled, Failed
}
struct SignAppAction: Action {
}

struct FacebookLoginAction: Action {
    var status: LoginActionStatus = .Started
    var tokenString = ""
}
func facebookLoginAction(loginVC: UIViewController) -> FacebookLoginAction {
    var action = FacebookLoginAction()
    
    let manager = LoginManager()
    manager.logIn(permissions: [.email], viewController: loginVC) { (loginResult) in
        switch loginResult {
            
        case .success(granted: _, declined: _, token: let token):
            action.status = .Success
            action.tokenString = token.tokenString
        case .cancelled:
            action.status = .Cancelled
            print("User cancelled login.")
        case .failed(_):
            action.status = .Failed
        }
        appStore.dispatch(action)
    }
    return action
}
