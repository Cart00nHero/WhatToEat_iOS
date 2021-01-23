//
//  NavigationViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/9/22.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit
import ReSwift

class NavigationViewController: UIViewController {

    @IBOutlet weak var mkMapView: MKMapView!
    @IBOutlet var modeTabButtons: [UIButton]!
    private var defaultTemplate: SceneViewController? = nil
    private lazy var presenter: NavigationPresenter = NavigationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? SceneViewController
        self.defaultTemplate?.stateDelegate = self
        defaultTemplate?.title = "Lead Me To My Food"
    }
    
    private func initialViewContorller() {
        mkMapView.delegate = self
//        for button in modeTabButtons {
//        }
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

extension NavigationViewController: SceneStateDelegate {
    func receiveNewState(state: SceneState) {
        if state.receivedParcel?.recipient == String(describing: type(of: self)) {
            switch state.receivedParcel?.parcelType {
            case "MKAnnotationDidSelectAction":
                NSLog("TTT")
                /*
                let parcelAction = state.receivedParcel?.parcel as! MKAnnotationDidSelectAction
                let gqAddress = parcelAction.selectedAddress
                // 終點座標
                let targetCoordinate = self.targetLocation.coordinate
                // 初始化 MKPlacemark
                let targetPlacemark = MKPlacemark(coordinate: targetCoordinate)
                // 透過 targetPlacemark 初始化一個 MKMapItem
                let targetItem = MKMapItem(placemark: targetPlacemark)
                // 使用當前使用者當前座標初始化 MKMapItem
                let userMapItem = MKMapItem.forCurrentLocation()
                // 建立導航路線的起點及終點 MKMapItem
                let routes = [userMapItem,targetItem]
                // 我們可以透過 launchOptions 選擇我們的導航模式，例如：開車、走路等等...
                MKMapItem.openMaps(with: routes, launchOptions: [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving])*/
            default: break
            }
        }
        switch state.currentAction {
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            switch action.status {
            case .DidUpdateLocation:
                if action.locations?.count ?? 0 > 0 {
                }
            default: break
            }
        default: break
        }
    }
}

extension NavigationViewController: MKMapViewDelegate {
    
}
