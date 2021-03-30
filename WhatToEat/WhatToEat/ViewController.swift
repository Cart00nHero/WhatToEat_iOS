//
//  ViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/3.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appStore.subscribe(self) {
            $0.select {
                $0.sceneState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        appStore.unsubscribe(self)
    }

}

extension ViewController: StoreSubscriber{
    func newState(state: SceneState) {
        switch state.currentAction {
        case let action as GetReviewStatusAction:
            if action.status != .Started {
                let toStoryBoard = UIStoryboard(name: "Entrance", bundle: nil)
                let toVC = toStoryBoard.instantiateViewController(withIdentifier: "SceneViewController") as? SceneViewController
                toVC?.childVC = toStoryBoard.instantiateViewController(withIdentifier: "MainMenuViewController")
                self.navigationController?.show(toVC!, sender: nil)
            }
        default: break
        }
    }
}
