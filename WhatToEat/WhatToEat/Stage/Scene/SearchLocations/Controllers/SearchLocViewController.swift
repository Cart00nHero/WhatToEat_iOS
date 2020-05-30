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

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let screenHeight = UIScreen.main.bounds.height
        barCenterVConstraint.constant = (screenHeight/3.0 - screenHeight/2.0) + 44.0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchTextField.inputAccessoryView = createInputAccessoryView()
        coverView = presenter.createCoverView(coverSuperView: bottomSelectedView)
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
    // MARK: - UI actions
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
    @objc func barDoneButtonClickAction(sender: UIBarButtonItem) {
        searchTextField.resignFirstResponder()
    }
}

extension SearchLocViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let storyboard = UIStoryboard.init(name: "AddGourmets", bundle: nil)
        let toVC = storyboard.instantiateViewController(withIdentifier: "AddGourmetViewController")
        defaultTemplate?.basePushToViewController(toVC, Animated: true)
        presenter.addressParcel.sender = String(describing: type(of: self))
        let deliveryMan = DeliveryMan()
        deliveryMan.applyDeliverService(parcel: presenter.addressParcel)
    }
}
extension SearchLocViewController: WKNavigationDelegate,WKUIDelegate {
}
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
                let addressObj = AddressObj()
                addressObj.latitude = action?.location?.coordinate.latitude ?? 0.0
                var address = Address()
                address.latitude = action?.location?.coordinate.latitude ?? 0.0
                address.latitude = action?.location?.coordinate.longitude ?? 0.0
                appStore.dispatch(createMapAnnotationsAction(locations: [(action?.location)!]))
            default: break
            }
        case is ReverseLocationAction:
            let action = state.currentAction as? ReverseLocationAction
            if action?.place != nil {
                appStore.dispatch(ParePlaceMarktoAddressAction(placeMark: (action?.place)!, address: Address()))
            }
        case is ParePlaceMarktoAddressAction:
            let action = state.currentAction as? ParePlaceMarktoAddressAction
            presenter.addressParcel.recipient = "AddGourmetViewController"
            presenter.addressParcel.parcelType = String(describing: type(of: action))
            presenter.addressParcel.parcel = action
        case is CreateMapAnnotationsAction:
            let action = state.currentAction as? CreateMapAnnotationsAction
            if action?.status == GeoCodeStatus.Completed {
                mapView.showAnnotations(action?.annotations ?? [], animated: true)
            }
        default: break
        }
    }
}
