//
//  OptionalViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class OptionalViewController: UIViewController {

    private var defaultTemplate: DefaultVCTemplate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
    }

    // MARK: - actions
    @IBAction func toAddGourmetsButtonClickAction(sender: UIButton) {
        // AddGourmets
        let addGourmetsSB = UIStoryboard.init(name: "AddGourmets", bundle: nil)
        let toVC = addGourmetsSB.instantiateViewController(withIdentifier: "AddGourmetViewController")
        defaultTemplate?.basePushToViewController(toVC, Animated: true)
    }

}

extension OptionalViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
    }
}
