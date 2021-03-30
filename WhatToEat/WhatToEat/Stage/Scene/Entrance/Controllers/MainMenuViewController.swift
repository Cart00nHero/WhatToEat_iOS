//
//  OptionalViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    private var sceneVC: SceneViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - actions
    @IBAction func toAddGourmetsButtonClickAction(sender: UIButton) {
        // AddGourmets
        let addGourmetsSB = UIStoryboard.init(name: "AddGourmets", bundle: nil)
        let toVC = addGourmetsSB.instantiateViewController(withIdentifier: "SearchLocViewController")
        sceneVC?.basePushToViewController(toVC, Animated: true)
    }
    @IBAction func toFindFoodButtonClickAction(sender: UIButton) {
        let findMyFoodSB = UIStoryboard.init(name: "FindMyFood", bundle: nil)
        let toVC = findMyFoodSB.instantiateViewController(identifier: "FindFoodViewController")
        sceneVC?.basePushToViewController(toVC, Animated: true)
        
    }

}

extension MainMenuViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
    }
}
