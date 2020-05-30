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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
        appStore.unsubscribe(self)
        stateDelegate = nil
    }

    // MARK: - Public Methods
    func registerKeyBoardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    // MARK: - UI Actions
    @objc private func adjustForKeyboard(notification: Notification) {
        appStore.dispatch(AdjustForKeyboardAction(notification: notification))
    }

}

extension DefaultVCTemplate: StoreSubscriber{
    func newState(state: DefaultTemplateState) {
        self.stateDelegate?.receiveNewState(state: state)
    }
}
