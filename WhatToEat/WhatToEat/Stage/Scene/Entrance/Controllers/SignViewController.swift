//
//  SignViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import AuthenticationServices

class SignViewController: UIViewController {

    private var scenario: SignScenario = SignScenario()
    private var sceneVC: SceneViewController? = nil
    
    @IBOutlet weak var signWithAppleButton: UIAuthorizationAppleIDButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        switch sender.tag {
        case 0:
            print("apple")
            scenario.beSignWithApple(vc: self)
        default:
            scenario.beFBCheckIfNeedSign(vc: self)
        }
    }
}

extension SignViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case let action as SignWithAppleAction:
            switch action.status {
            case .Success:
                let currentId = action.responseData?.uniqueId ?? ""
                UserDefaults.standard.setValue(currentId, forKey: "Signed_Foodie_Id")
                SingletonStorage.shared.foodieId = currentId
                appStore.dispatch(GoMenuSeceneAction())
            default: break
            }
        case let action as SignFoodieAction:
            switch action.status {
            case .Success:
                let currentId = action.responseData?.uniqueId ?? ""
                UserDefaults.standard.setValue(currentId, forKey: "Signed_Foodie_Id")
                SingletonStorage.shared.foodieId = currentId
                appStore.dispatch(GoMenuSeceneAction())
            default: break
            }
        case is GoMenuSeceneAction:
            let toVC = self.storyboard?.instantiateViewController(identifier: "MainMenuViewController")
            sceneVC?.basePushToViewController(toVC!, Animated: true)
        default: break
        }
    }
}
