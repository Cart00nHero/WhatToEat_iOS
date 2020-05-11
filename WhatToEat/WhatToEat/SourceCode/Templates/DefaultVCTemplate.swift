//
//  DefaultTemplate.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/9.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

protocol DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState)
}
class DefaultVCTemplate: UIBaseViewController {

    var stateDelegate: DefaultTemplateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appStore.subscribe(self) {
            $0.select {
                $0.defaultTemplateState
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appStore.unsubscribe(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DefaultVCTemplate: StoreSubscriber{
    func newState(state: DefaultTemplateState) {
        self.stateDelegate?.receiveNewState(state: state)
    }
}
