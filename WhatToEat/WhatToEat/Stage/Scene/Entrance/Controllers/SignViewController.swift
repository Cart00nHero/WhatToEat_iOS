//
//  SignViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import FacebookLogin

class SignViewController: UIViewController {

    private var defaultTemplate: DefaultVCTemplate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appStore.dispatch(RegisterStateAction(subscriber: String(describing: type(of: self))))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.defaultTemplate?.stateDelegate = nil
    }

    // MARK: - actions
    @IBAction func loginButtonClickAction(_ sender: UIButton) {
        var whereCMD = FoodieDqCmd()
        whereCMD.email = "morris@email.com"
        appStore.dispatch(foodiesDynamicQueryAction(whereCMD: whereCMD))
    }
}

extension SignViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        switch state.currentAction {
        case let action as FoodiesDynamicQueryAction:
            switch action.status {
            case .Success:
                if action.responseData?.count == 0 {
                    let tokenData =
                        InputToken(token: "dafjnsdss", type: "FaceBook")
                    appStore.dispatch(
                        createFoodieAction(email: "morris@gmail.com", name: "Morris", gender: 1, token: tokenData))
                    
                } else {
                    // update
                }
            default: break
            }
        case let action as CreateFoodieAction:
            switch action.status {
            case .Success: break
            default: break
            }
        case _ as SignAppAction:
            let toVC = self.storyboard?.instantiateViewController(identifier: "MainMenuViewController")
            defaultTemplate?.basePushToViewController(toVC!, Animated: true)
        default: break
        }
    }
}
