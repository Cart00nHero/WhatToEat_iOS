//
//  FindFoodViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/11.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class FindFoodViewController: UIViewController {
    
    private var scenario: FindFoodScenario = FindFoodScenario()
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var mkMapView: MKMapView!
    @IBOutlet weak private var radarView: RadarScanView!
    @IBOutlet weak private var rangeButton: UIButton!
    @IBOutlet weak private var locateButton: UIButton!
    private var annotationViewTag: Int = -1
    private var queryCount: Int = 0
    private var sceneVC: SceneViewController? = nil
    var tableData =
        FindFoodTableData(dataObj: SearchForRangeQuery.Data.SearchForRange())
    private var willMarkAnnotations = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewContorller()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sceneVC = self.parent as? SceneViewController
        self.sceneVC?.stateDelegate = self
        sceneVC?.title = "Find My Food"
    }
    
    private func initialViewContorller() {
        mkMapView.delegate = self
        scenario.beSetScenarioMap(map: mkMapView)
        startRadarAnimating()
        scenario.beRequestCurrentLocation()
        tableHeightConstraint.constant = 48.0 * CGFloat(tableData.dataSource.count)
    }
    private func startRadarAnimating() {
        DispatchQueue.main.async { [self] in
            mkMapView.isUserInteractionEnabled = false
            radarView.startRadarAnimation()
        }
    }
    private func stopRadarAnimating() {
        DispatchQueue.main.async { [self] in
            mkMapView.isUserInteractionEnabled = true
            radarView.stopRadarAnimation()
        }
    }
    
    private func updateRangeValue() {
        let level = mkMapView.zoomLevel
        if level >= 17 {
            rangeButton.setTitle("0.2KM", for: .normal)
            return
        }
        
        if level == 16 {
            rangeButton.setTitle("0.5KM", for: .normal)
            return
        }
        if level <= 15 {
            rangeButton.setTitle("1.0KM", for: .normal)
            return
        }
    }
    
    // MARK: - UI Actions
    @IBAction func locateButtonClickAction(_ sender: UIButton) {
        startRadarAnimating()
        scenario.beRequestCurrentLocation()
    }
    @objc private func rigtBarButtonClickAction(sender: UIBarButtonItem) {
        
    }
    
}

extension FindFoodViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = tableData.dataSource[indexPath.row]
        var cellIdentifier = "FindFoodTableViewCell"
        switch data.templateStyle {
        case .Button:
            cellIdentifier = "FFBtnTableViewCell"
        default: break
        }
        let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "FindFoodTableViewCell" {
            let contentCell = cell as! FindFoodTableViewCell
            contentCell.cellTemplate = data as? LRTemplate
        }else {
            let contentCell = cell as! FFBtnTableViewCell
            contentCell.cellData = data as? ButtonTemplate
        }
        return cell
    }
    
}

extension FindFoodViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            switch action.status {
            case .DidUpdateLocation:
                stopRadarAnimating()
            default: break
            }
        case is SearchForRangeAction:
            let action = state.currentAction as! SearchForRangeAction
            switch action.status {
            case .Success:
                stopRadarAnimating()
                if action.responseData?.count ?? 0 > 0 {
                    queryCount = action.responseData?.count ?? 0
                    scenario.beStoreQueryData(queryData: action.responseData!)
                    willMarkAnnotations = true
                    scenario.beMarkFoundPlacesOnMap(queryData: action.responseData!)
                } else {
                    scenario.beGetCenterPoint { [self] (centerPt) in
                        if centerPt.zoomLevel == mkMapView.zoomLevel {
                            if centerPt.coordinate != nil {
                                scenario.beUpdateMapRegion(
                                    zoomLevel: centerPt.zoomLevel, center: centerPt.coordinate!)
                            }
                        }
                    }
                }
            case .Failed:
                stopRadarAnimating()
            default: break
            }
        case is SearchInNewRangeAction:
            startRadarAnimating()
            scenario.beSearchNearby()
        case is TableCellButtonClickAction:
            let toVC = self.storyboard?.instantiateViewController(identifier: "NavigationViewController")
            sceneVC?.basePushToViewController(toVC!, Animated: true)
        default: break
        }
    }
    
}

extension FindFoodViewController: MKMapViewDelegate, UIGestureRecognizerDelegate {
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        scenario.beGetCenterPoint { [self] (centerPt) in
            if centerPt.zoomLevel == mkMapView.zoomLevel {
                if centerPt.coordinate != nil {
                    scenario.beUpdateMapRegion(
                        zoomLevel: centerPt.zoomLevel, center: centerPt.coordinate!)
                }
            }
        }
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        updateRangeValue()
        scenario.beUpdateCenterPointZoomLevel()
    }
    func mapView(_ mapView: MKMapView,rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // If you want to include other shapes, then this check is needed.
        // If you only want circles, then remove it.
        if let circleOverlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(overlay: circleOverlay)
            circleRenderer.lineWidth = 5.0
            circleRenderer.strokeColor = .red
//            circleRenderer.fillColor = .black
            circleRenderer.alpha = 1.0
            return circleRenderer
        }
        
        // If other shapes are required, handle them here
        return MKOverlayRenderer()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotationViewTag == -1 {
            annotationViewTag = queryCount-1
        }
        let identifier = "MyPin"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        // 重複使用地圖標註
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView =
                MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        /*
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
         */
        annotationView?.tag = annotationViewTag
        if annotationViewTag > 0 {
            annotationViewTag -= 1
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        annotationViewTag = -1
        if willMarkAnnotations {
            scenario.beMoveMapCenterToCenterPoint()
            willMarkAnnotations = false
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        scenario.beGetQueryData { [self] (queryData) in
            tableData.reloadData(data: queryData[view.tag]!)
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            let gesture = gestureRecognizer as! UIPanGestureRecognizer
            if gesture.state == .ended {
                scenario.beSearchInNewRange()
            }
        }
        return true
    }
}
