//
//  SearchLocViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/26.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import WebKit
import MapKit
import SafariServices

class SearchLocViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var topSelectedView: UIView!
    @IBOutlet weak var bottomSelectedView: UIView!
    @IBOutlet weak var barCenterVConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    private lazy var coverView: UIView = UIView()
    private lazy var presenter: SearchLocPresenter = SearchLocPresenter()
    
    private var defaultTemplate: DefaultVCTemplate? = nil
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
        defaultTemplate?.title = "Search"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let screenHeight = UIScreen.main.bounds.height
        barCenterVConstraint.constant = (screenHeight/3.0 - screenHeight/2.0) + 44.0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let rightBarButtonItem = UIBarButtonItem(title: "Locate", style: .plain, target: self,
                                             action: #selector(rigtBarButtonClickAction(sender:)))
        defaultTemplate?.navigationItem.rightBarButtonItem = rightBarButtonItem
        searchTextField.inputAccessoryView = createInputAccessoryView()
        coverView = presenter.createCoverView(coverSuperView: bottomSelectedView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coverView.removeFromSuperview()
    }

    // MARK: - Private methods
    private func createWebViewOnBottom() {
        presenter.isWebViewCreated = true
        webView.backgroundColor = UIColor.clear
        webView.translatesAutoresizingMaskIntoConstraints = false
        bottomSelectedView.addSubview(webView)
        bottomSelectedView?.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-2-[webView]-2-|", options: [], metrics: nil, views: ["webView": webView]))
        bottomSelectedView?.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-2-[webView]-2-|", options: [], metrics: nil, views: ["webView": webView]))
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    private func createInputAccessoryView() -> UIView {
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(barDoneButtonClickAction(sender:)))
        toolBar.setItems([flexible, barButton], animated: false)
        return toolBar
    }
    // MARK: - UI Actions
    @IBAction func searchButtonClickAction(sender: UIButton) {
        searchTextField.resignFirstResponder()
        switch presenter.searchMode {
        case .MapLocation:
            print("Map")
            appStore.dispatch(geoCodeAddressAction(address: searchTextField.text ?? ""))
        case .Google:
            print("Google")
            if presenter.isWebViewCreated == false {
                createWebViewOnBottom()
            }
            let urlString = presenter.googleSearchUrl(queryText: searchTextField.text ?? "")
            let ecodeUrl = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let request = NSURLRequest(url: URL(string: ecodeUrl)!)
            webView.load(request as URLRequest)
        }
    }
    @objc private func barDoneButtonClickAction(sender: UIBarButtonItem) {
        searchTextField.resignFirstResponder()
    }
    @objc private func rigtBarButtonClickAction(sender: UIBarButtonItem) {
        LocationMaster.shared.requestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
        LocationMaster.shared.setAccuracyAndDistanceFilter(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
        LocationMaster.shared.requestCurrentLocation()
    }
}
    // MARK: - MKMapViewDelegate
extension SearchLocViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if presenter.locationParcel.parcelType == "CreateMapAnnotationsAction" {
            let parcelAction = presenter.locationParcel.parcel as! CreateMapAnnotationsAction
            appStore.dispatch(MKAnnotationDidSelectAction(selectedIndex: view.tag, selectedLoc: parcelAction.addresses[view.tag]))
        }
    }
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        var viewTag = 0
        for view in views {
            view.tag = viewTag
            viewTag += 1
        }
    }
}
// MARK: - WKNavigationDelegate,WKUIDelegate
extension SearchLocViewController: WKNavigationDelegate,WKUIDelegate {
}
// MARK: - DefaultTemplateDelegate
extension SearchLocViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        switch state.currentAction {
        case is ReceivedTapAction:
            let action = state.currentAction as? ReceivedTapAction
            if coverView.superview == topSelectedView {
                topSelectedView.backgroundColor = presenter.selectedBgColor()
                presenter.setViewDefaultStyle(selectView: bottomSelectedView)
                coverView.removeGestureRecognizer(action!.tapGesture)
                coverView.removeFromSuperview()
                coverView = presenter.createCoverView(coverSuperView: bottomSelectedView)
                presenter.searchMode = .MapLocation
            } else {
                topSelectedView.backgroundColor = presenter.normalBgColor()
                presenter.setViewSelectedStyle(selectView: bottomSelectedView)
                coverView.removeGestureRecognizer(action!.tapGesture)
                coverView.removeFromSuperview()
                coverView = presenter.createCoverView(coverSuperView: topSelectedView)
                presenter.searchMode = .Google
            }
        case is GeoCodeAddressAction:
            let action = state.currentAction as? GeoCodeAddressAction
            switch action?.status {
            case .Started:
                mapView.removeAnnotations(mapView.annotations)
            case .Completed:
                appStore.dispatch(reverseLocationAction(location: (action?.location)!))
            default: break
            }
        case is ReverseLocationAction:
            let action = state.currentAction as? ReverseLocationAction
            if action?.place != nil {
                appStore.dispatch(ParcePlaceMarkToAddressAction(
                    queryLoc: true, placeMark: (action?.place)!,
                    address: initGQInputObject())
                )
            }
        case is LocationsDynamicQueryAction:
            let action = state.currentAction as! LocationsDynamicQueryAction
            switch action.status {
            case .Success:
                var markAddress = [GQInputObject]()
                if action.responseData?.count ?? 0 > 0 {
                    presenter.locationParcel.parcelType = String(describing: type(of: action))
                    for queryData in action.responseData! {
                        let address = locationsDynamicQueryToGQInputObj(result: queryData!)
                        markAddress.append(address)
                    }
                    appStore.dispatch(createMapAnnotationsAction(inputObj: markAddress))
                } else {
                    let parcelAction = presenter.locationParcel.parcel as? ParcePlaceMarkToAddressAction
                    guard let address = parcelAction?.inputObj else { return }
                    markAddress.append(address)
                    appStore.dispatch(createMapAnnotationsAction(inputObj: markAddress))
                }
            default: break
            }
        case is ParcePlaceMarkToAddressAction:
            var action = state.currentAction as! ParcePlaceMarkToAddressAction
            if presenter.locationParcel.parcelType == "LocatePositionAction" {
                action.inputObj.address.completeInfo = combineAddressCompleteInfo(input: action.inputObj)
                searchTextField.text = action.inputObj.address.completeInfo
            }
            if presenter.locationParcel.parcelType != "LocationsDynamicQueryAction" {
                presenter.locationParcel.parcelType = String(describing: type(of: action))
                presenter.locationParcel.parcel = action
            }
        case is CreateMapAnnotationsAction:
            let action = state.currentAction as! CreateMapAnnotationsAction
            presenter.locationParcel.parcelType = String(describing: type(of: action))
            presenter.locationParcel.parcel = action
            if action.status == GeoActionStatus.Completed {
                mapView.showAnnotations(action.annotations , animated: true)
            }
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            switch action.status {
            case .DidUpdateLocation:
                if action.locations?.count ?? 0 > 0 {
                    presenter.locationParcel.parcelType = String(describing: type(of: action))
                    appStore.dispatch(reverseLocationAction(location: (action.locations?[0])!))
                }
            default: break
            }
        case is MKAnnotationDidSelectAction:
            let action = state.currentAction as! MKAnnotationDidSelectAction
            presenter.locationParcel.recipient = "AddGourmetViewController"
            presenter.locationParcel.parcelType = String(describing: type(of: action))
            presenter.locationParcel.parcel = action
            let storyboard = UIStoryboard.init(name: "AddGourmets", bundle: nil)
            let toVC = storyboard.instantiateViewController(withIdentifier: "AddGourmetViewController")
            defaultTemplate?.basePushToViewController(toVC, Animated: true)
            presenter.locationParcel.sender = String(describing: type(of: self))
            let deliveryMan = DeliveryMan()
            deliveryMan.applyDeliverService(parcel: presenter.locationParcel)
        default: break
        }
    }
}
