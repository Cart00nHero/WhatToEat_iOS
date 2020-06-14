//
//  DeliveryMan.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/28.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift

class ParcelObject: NSObject {
    public typealias T = Action
    @objc dynamic var parcelType: String = ""
    @objc dynamic var sender = ""
    @objc dynamic var recipient = ""
    var parcel: Action?
}
class DeliveryMan: NSObject {
    
//    struct ParcelObject {
//        var parcelType: Observable<String>
//        var sender: Observable<String>
//        var recipient: Observable<String>
//        var parcel: Action?
//
//        init(parcelType: String, sender: String, recipient: String) {
//            self.parcelType = Observable(parcelType)
//            self.sender = Observable(sender)
//            self.recipient = Observable(recipient)
//        }
//    }
    static let shareInstance = DeliveryMan()
    private var parcelObj: ParcelObject?
    private var isSubscribed = true
    
    override init() {
        super.init()
        subscribeDeliveryState()
    }
    func applyExpressService(applicant: AnyObject, parcel: ParcelObject,actionSelector: Selector) {
        if !isSubscribed {
            subscribeDeliveryState()
        }
        parcelObj = parcel
        _ = applicant.perform(actionSelector)
    }
    func applyDeliverService(parcel: ParcelObject) {
        if !isSubscribed {
            subscribeDeliveryState()
        }
        parcelObj = parcel
        appStore.dispatch(SendParcelAction( parcel: parcel))
    }
    
    func subscribeDeliveryState() {
        appStore.subscribe(self) {
            $0.select {
                $0.deliveryState
            }
        }
        isSubscribed = true
    }
    func unsubscribeDeliveryState() {
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
            if parcelObj?.parcelType == String(describing: type(of: state.currentAction)) {
                parcelObj?.parcel = state.currentAction
                appStore.dispatch(SendParcelAction(parcel: parcelObj!))
            }
        }
    }
}
