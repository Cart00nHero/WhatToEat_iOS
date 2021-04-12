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
    
    enum SearchMode {
        case Map, Google
    }
    
    private let scenario: SearchLocScenario = SearchLocScenario()
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var topSelectedView: UIView!
    @IBOutlet weak var bottomSelectedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    private lazy var coverView: UIView = UIView()
    private var isWebViewCreated = false
    private var searchMode: SearchMode = .Map
    private var sceneVC: SceneViewController? = nil
    private let webView = WKWebView()
    private var sfSafariVC: SFSafariViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
        sceneVC?.title = "地址輸入"
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        let screenHeight = UIScreen.main.bounds.height
        //        barCenterVConstraint.constant = (screenHeight/3.0 - screenHeight/2.0) + 44.0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let image = UIImage(named: "icon_gps") {
            scenario.beResizeBarButtonItemImage(image: image) { [self] (newImage) in
                let rightBarButtonItem = UIBarButtonItem(
                    image: newImage.withRenderingMode(.alwaysOriginal),
                    style: .plain, target: self,
                    action: #selector(rigtBarButtonClickAction(sender:)))
                sceneVC?.navigationItem.rightBarButtonItem = rightBarButtonItem
            }
        }
        searchTextField.inputAccessoryView = createInputAccessoryView()
        coverView = createCoverView(coverSuperView: bottomSelectedView)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        coverView.removeFromSuperview()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scenario.beCancelFoundLocParcel()
        mapView.removeAnnotations(mapView.annotations)
    }
    
    // MARK: - Private methods
    
    private func createWebViewOnBottom() {
        isWebViewCreated = true
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
    private func showSafariVCOnBottom(url: String) {
        isWebViewCreated = true
        if sfSafariVC != nil {
            sfSafariVC?.view.removeFromSuperview()
            sfSafariVC?.removeFromParent()
            sfSafariVC = nil
        }
        
        let sfVC = SFSafariViewController(url: URL(string: url)!)
        self.addChild(sfVC)
        let sfWebView = sfVC.view
        sfWebView?.translatesAutoresizingMaskIntoConstraints = false
        bottomSelectedView.addSubview(sfWebView!)
        bottomSelectedView?.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-2-[sfWebView]-2-|", options: [], metrics: nil, views: ["sfWebView": sfWebView!]))
        bottomSelectedView?.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-2-[sfWebView]-2-|", options: [], metrics: nil, views: ["sfWebView": sfWebView!]))
        sfVC.didMove(toParent: self)
        sfSafariVC = sfVC
    }
    
    private func createInputAccessoryView() -> UIView {
        let screenWidth = UIScreen.main.bounds.width
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(barDoneButtonClickAction(sender:)))
        toolBar.setItems([flexible, barButton], animated: false)
        return toolBar
    }
    private func createCoverView(coverSuperView: UIView) -> UIView {
        let coverView = UIView()
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.backgroundColor = UIColor.clear
        coverSuperView.addSubview(coverView)
        coverSuperView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[coverView]-|", options: [], metrics: nil, views: ["coverView": coverView]))
        coverSuperView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[coverView]-|", options: [], metrics: nil, views: ["coverView": coverView]))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(coverViewTapGesture(sender:)))
        coverView.addGestureRecognizer(tapGesture)
        return coverView
    }
    private func setViewSelectedStyle(selectView: UIView) {
        selectView.layer.borderWidth = 2.0
        selectView.layer.borderColor = selectedBgColor().cgColor
    }
    private func normalBgColor() -> UIColor {
        return UIColor(red: 255.0/255.0, green: 248.0/255.0, blue: 220.0/255.0, alpha: 1.0)
    }
    private func selectedBgColor() -> UIColor {
        return UIColor(
            red: 71.0/255.0, green: 0.0/255.0, blue: 36.0/255.0, alpha: 1.0)
    }
    // MARK: - UI Actions
    @IBAction func searchButtonClickAction(sender: UIButton) {
        searchTextField.resignFirstResponder()
        switch searchMode {
        case .Map:
            print("Map")
            scenario.beInquireIntoAddressesLocation(
                address: searchTextField.text ?? "")
        case .Google:
            print("Google")
            if isWebViewCreated == false {
                createWebViewOnBottom()
            }
            scenario.beGoogleSearchUrl(searchTextField.text ?? "") {
                [self] (urlString) in
                let ecodeUrl =
                    urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                let request = NSURLRequest(url: URL(string: ecodeUrl)!)
                webView.load(request as URLRequest)
            }
        }
    }
    @objc private func barDoneButtonClickAction(sender: UIBarButtonItem) {
        searchTextField.resignFirstResponder()
    }
    @objc private func rigtBarButtonClickAction(sender: UIBarButtonItem) {
        scenario.beRequestCurrentLocation()
    }
    @objc private func coverViewTapGesture(sender: UITapGestureRecognizer) {
        appStore.dispatch(ReceivedTapAction(tapGesture: sender))
    }
    @objc func setViewDefaultStyle(selectView: UIView) {
        selectView.layer.borderWidth = 0.0
        selectView.layer.borderColor = normalBgColor().cgColor
    }
}
// MARK: - MKMapViewDelegate
extension SearchLocViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        scenario.bePrepareGoFoundLocScenario { [self] (isPrepared) in
            if isPrepared {
                let presentVC =
                    self.storyboard?.instantiateViewController(identifier: "FoundLocViewController")
                sceneVC?.basePresentViewController(presentVC!, Animated: true)
                mapView.removeAnnotations(mapView.annotations)
            } else {
                appStore.dispatch(GoAddGourmetScenarioAction())
            }
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
extension SearchLocViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case let action as ReceivedTapAction:
            if coverView.superview == topSelectedView {
                topSelectedView.backgroundColor = selectedBgColor()
                setViewDefaultStyle(selectView: bottomSelectedView)
                coverView.removeGestureRecognizer(action.tapGesture)
                coverView.removeFromSuperview()
                coverView = createCoverView(coverSuperView: bottomSelectedView)
                searchMode = .Map
            } else {
                topSelectedView.backgroundColor = normalBgColor()
                setViewSelectedStyle(selectView: bottomSelectedView)
                coverView.removeGestureRecognizer(action.tapGesture)
                coverView.removeFromSuperview()
                coverView = createCoverView(coverSuperView: topSelectedView)
                searchMode = .Google
            }
        case let action as LocationsDynamicQueryAction:
            switch action.status {
            case .Success:
                if action.responseData?.count ?? 0 > 0 {
                    scenario.beGetQueryDataMarkers(
                        queryData: action.responseData!) { (annotations) in
                        appStore.dispatch(
                            MapClearAndShowAnnotationsAction(
                                annotions: annotations))
                    }
                } else {
                    scenario.beGetFoundPlacesMarkers { (annotations) in
                        appStore.dispatch(
                            MapClearAndShowAnnotationsAction(
                                annotions: annotations))
                    }
                }
            default: break
            }
        case let action as FoundLocationsAddressAction:
            searchTextField.text = action.inputObj.address.completeInfo
        case let action as MapClearAndShowAnnotationsAction:
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(action.annotions)
            let region = MKCoordinateRegion(
                center: action.annotions[0].coordinate,
                latitudinalMeters: CLLocationDistance(200.0),
                longitudinalMeters: CLLocationDistance(200.0)
            )
            mapView.setRegion(region, animated: true)
        case is GoAddGourmetScenarioAction:
            let toVC =
                self.storyboard?.instantiateViewController(
                    withIdentifier: "AddGourmetViewController") as! AddGourmetViewController
            sceneVC?.basePushToViewController(toVC, Animated: true)
        default: break
        }
    }
}
