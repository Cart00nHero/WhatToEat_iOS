//
//  SignViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

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
//        let service = ApolloService.shared.apollo
//        let createFoodie = CreateFoodieMutation(email: "abc@gmail.com", name: "Morris", token: InputTo)
//        service.perform(mutation: createFoodie) { result in
//            switch result {
//            case .success(let graphQLResult):
//                if (graphQLResult.data?.createFoodie) != nil {
//                    print("成功")
//                }
//                if graphQLResult.errors != nil {
//                    print("幹咧")
//                    print(graphQLResult.errors?.description ?? "")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        appStore.dispatch(SignAppAction())
    }
}

extension SignViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        switch state.currentAction {
        case _ as SignAppAction:
            let toVC = self.storyboard?.instantiateViewController(identifier: "MainMenuViewController")
            defaultTemplate?.basePushToViewController(toVC!, Animated: true)
        case _ as FacebookLoginAction:
            let action = state.currentAction as! FacebookLoginAction
            if action.status == .Success {
                let toVC = self.storyboard?.instantiateViewController(identifier: "MainMenuViewController")
                defaultTemplate?.basePushToViewController(toVC!, Animated: true)
            }
        default: break
        }
    }
}
