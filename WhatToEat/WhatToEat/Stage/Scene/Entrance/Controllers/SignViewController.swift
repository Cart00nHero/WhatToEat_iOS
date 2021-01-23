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

    private var sceneVC: SceneViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appStore.dispatch(RegisterStateAction(subscriber: String(describing: type(of: self))))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.sceneVC?.stateDelegate = nil
    }

    // MARK: - actions
    @IBAction func loginButtonClickAction(_ sender: UIButton) {
        let signData = SignData(email: "morrislin@gmail.com", name: "Morris",
                                token: InputToken(token: "lhuiaskdjslhaskx", type: "Facebook"))
        appStore.dispatch(signFoodieAction(signData: signData))
    }
}

extension SignViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case let action as SignFoodieAction:
            switch action.status {
            case .Success:
                globalFoodieId = action.responseData?.uniqueId ?? ""
                let toVC = self.storyboard?.instantiateViewController(identifier: "MainMenuViewController")
                sceneVC?.basePushToViewController(toVC!, Animated: true)
            default: break
            }
        default: break
        }
    }
}
