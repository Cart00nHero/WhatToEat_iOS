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
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var mkMapView: MKMapView!
    @IBOutlet weak private var radarView: RadarScanView!
    @IBOutlet weak private var rangeButton: UIButton!
    @IBOutlet weak private var locateButton: UIButton!
    private var annotationViewTag: Int = -1
    private var defaultTemplate: SceneViewController? = nil
    private lazy var presenter: FindFoodPresenter = FindFoodPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewContorller()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? SceneViewController
        self.defaultTemplate?.stateDelegate = self
        defaultTemplate?.title = "Find My Food"
    }
    
    private func initialViewContorller() {
        mkMapView.delegate = self
        LocationMaster.shared.requestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
        LocationMaster.shared.setAccuracyAndDistanceFilter(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
        startRadarAnimating()
        LocationMaster.shared.requestCurrentLocation()
        tableHeightConstraint.constant = 48.0 * CGFloat(presenter.tableData.dataSource.count)
    }
    func startRadarAnimating() {
        mkMapView.isUserInteractionEnabled = false
        radarView.startRadarAnimation()
    }
    func stopRadarAnimating() {
        mkMapView.isUserInteractionEnabled = true
        radarView.stopRadarAnimation()
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
        LocationMaster.shared.requestCurrentLocation()
    }
    @objc private func rigtBarButtonClickAction(sender: UIBarButtonItem) {
        
    }
    
}

extension FindFoodViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableData.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.tableData.dataSource[indexPath.row]
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
    func receiveNewState(state: SceneState) {
        switch state.currentAction {
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            startRadarAnimating()
            switch action.status {
            case .DidUpdateLocation:
                if action.locations?.count ?? 0 > 0 {
                    presenter.currentLoc = action.locations?.first
                    presenter.centerCoordinate = presenter.currentLoc?.coordinate
                    appStore.dispatch(SearchNearbyAction(center: presenter.centerCoordinate!,
                                                         range: presenter.searchRange(zoomLevel: 17)))
                }
            default: break
            }
        case is SearchForRangeAction:
            if presenter.isFirsTimeEntrance {
                presenter.isFirsTimeEntrance = false
                return
            }
            let action = state.currentAction as! SearchForRangeAction
            switch action.status {
            case .Success:
                stopRadarAnimating()
                if action.responseData?.count ?? 0 > 0 {
                    presenter.searchCounts = action.responseData?.count ?? 0
                    presenter.searchResults = action.responseData!
                    appStore.dispatch(markRangeSearchDataActions(queryData: action.responseData!))
                } else {
                    presenter.setMapZoomLevel(mapView: mkMapView,
                                              level: presenter.mapZoomLevel, center: presenter.centerCoordinate!)
                }
            case .Failed:
                stopRadarAnimating()
            default: break
            }
        case is MarkRangeSearchDataAction:
            let action = state.currentAction as! MarkRangeSearchDataAction
            stopRadarAnimating()
            if action.status == .Completed {
                MapNavigator.removeAllMapAnnotations(mapView: mkMapView)
                presenter.annotations.removeAll()
                presenter.annotations = action.annotations
                MapNavigator.displayAnnotations(mapView: mkMapView, annotations: presenter.annotations, animated: false)
            }
        case is UIPanGestureRecognizerAction:
            let distance =
                calculateCoordinateDistance(from: presenter.centerCoordinate!, to: mkMapView.camera.centerCoordinate)
            let searchingDistance = (presenter.searchRange(zoomLevel: mkMapView.zoomLevel)*1000)*2
            if distance > searchingDistance {
                clearApolloServiceCache()
                startRadarAnimating()
                let level = mkMapView.zoomLevel
                appStore.dispatch(SearchNearbyAction(center: mkMapView.camera.centerCoordinate, range: presenter.searchRange(zoomLevel: level)))
            }
            presenter.centerCoordinate = mkMapView.camera.centerCoordinate
        case is GestureRecognizerEndedAction:
            if presenter.isSearchRangeChanged() {
                appStore.dispatch(
                    SearchNearbyAction(center: mkMapView.camera.centerCoordinate, range: presenter.searchRange(zoomLevel: presenter.mapZoomLevel)))
                presenter.preZoomLevel = presenter.mapZoomLevel
                presenter.centerCoordinate = mkMapView.camera.centerCoordinate
            }
        case is MapRegionWillChangeAction:
            let action = state.currentAction as! MapRegionWillChangeAction
            if presenter.preZoomLevel == presenter.mapZoomLevel {
                presenter.setMapZoomLevel(mapView: action.mapView,
                                          level: presenter.mapZoomLevel, center: presenter.centerCoordinate!)
            }
            presenter.preZoomLevel = action.mapView.zoomLevel
        case is MapDidChangeVisibleRegionAction:
            let action = state.currentAction as! MapDidChangeVisibleRegionAction
            updateRangeValue()
            presenter.mapZoomLevel = action.mapView.zoomLevel
        case is TableCellButtonClickAction:
            let toVC = self.storyboard?.instantiateViewController(identifier: "NavigationViewController")
            defaultTemplate?.basePushToViewController(toVC!, Animated: true)
        default: break
        }
    }
    
}

extension FindFoodViewController: MKMapViewDelegate, UIGestureRecognizerDelegate {
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        appStore.dispatch(MapRegionWillChangeAction(mapView: mapView))
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        appStore.dispatch(MapRegionDidChangeAction(mapView: mapView))
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        appStore.dispatch(MapDidChangeVisibleRegionAction(mapView: mapView))
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
            annotationViewTag = presenter.searchCounts-1
            presenter.willMarkAnnotations = true
        }
        let identifier = "MyPin"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        // 重複使用地圖標註
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
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
        if presenter.willMarkAnnotations {
            MapNavigator.setCenterCoordinate(mapView: mkMapView, coordinate: presenter.centerCoordinate!)
            presenter.willMarkAnnotations = false
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if presenter.searchResults.count > 0 {
            presenter.tableData.reloadData(data: presenter.searchResults[view.tag]!)
            tableView.reloadData()
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            let gesture = gestureRecognizer as! UIPanGestureRecognizer
            appStore.dispatch(UIPanGestureRecognizerAction(sender: gesture))
            if gestureRecognizer.state == .ended {
                appStore.dispatch(GestureRecognizerEndedAction(sender: gestureRecognizer))
            }
        }
        return true
    }
}
