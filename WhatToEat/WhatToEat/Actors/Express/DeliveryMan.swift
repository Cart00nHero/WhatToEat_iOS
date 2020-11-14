//
//  DeliveryMan.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/28.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

class DeliveryMan: NSObject {
    
    struct ParcelObject {
        var parcelType: String = ""
        var sender = ""
        var recipient = ""
        var parcel: Action?
    }
    
    static let shareInstance = DeliveryMan()
    private var parcel: ParcelObject?
    private var isSubscribed = true
    
    override init() {
        super.init()
        subscribeDeliveryState()
    }
    
    func packageParcel(sender: Any, to: Any,content: Action) -> ParcelObject {
        var parcel = ParcelObject()
        parcel.sender = String(describing: type(of: sender))
        parcel.recipient = String(describing: type(of: to))
        parcel.parcel = content
        parcel.parcelType = String(describing: type(of: content))
        return parcel
    }
    func applyExpressService(applicant: AnyObject, parcel: ParcelObject,actionSelector: Selector) {
        if !isSubscribed {
            subscribeDeliveryState()
        }
        self.parcel = parcel
        _ = applicant.perform(actionSelector)
    }
    func applyDeliverService(parcel: ParcelObject) {
        if !isSubscribed {
            subscribeDeliveryState()
        }
        self.parcel = parcel
        appStore.dispatch(SendParcelAction( parcel: parcel))
    }
    
    private func subscribeDeliveryState() {
        appStore.subscribe(self) {
            $0.select {
                $0.deliveryState
            }
        }
        isSubscribed = true
    }
    private func unsubscribeDeliveryState() {
        appStore.unsubscribe(self)
        isSubscribed = false
    }
}

func classFromString(_ className: String) -> AnyClass! {

    /// get namespace
    let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

    /// get 'anyClass' with classname and namespace
    let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!

    // return AnyClass!
    return cls
}
extension DeliveryMan: StoreSubscriber {
    func newState(state: DeliveryState) {
        if state.currentAction is SignParcelReceiptAction {
            unsubscribeDeliveryState()
        } else {
            if parcel?.parcelType == String(describing: type(of: state.currentAction)) {
                parcel?.parcel = state.currentAction
                appStore.dispatch(SendParcelAction(parcel: parcel!))
            }
        }
    }
}
