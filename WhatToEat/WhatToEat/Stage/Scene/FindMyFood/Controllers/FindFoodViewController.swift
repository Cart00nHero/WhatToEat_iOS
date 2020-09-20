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
    private var annotationViewTag: Int = 0
    
    
    private var defaultTemplate: DefaultVCTemplate? = nil
    private lazy var presenter: FindFoodPresenter = FindFoodPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewContorller()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.defaultTemplate = self.parent as? DefaultVCTemplate
        self.defaultTemplate?.stateDelegate = self
        //        let barImage = #imageLiteral(resourceName: "Icon_Locate_On")
        //        barImage.withRenderingMode(.alwaysOriginal)
        //        let rightBarButtonItem =
        //            UIBarButtonItem(image: barImage, style: .plain, target: self, action: #selector(rigtBarButtonClickAction(sender:)))
        //        defaultTemplate?.navigationItem.rightBarButtonItem = rightBarButtonItem
        defaultTemplate?.title = "Find My Food"
    }
    
    private func initialViewContorller() {
        mkMapView.delegate = self
        LocationMaster.shared.requestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
        LocationMaster.shared.setAccuracyAndDistanceFilter(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
        LocationMaster.shared.requestCurrentLocation()
        
        tableHeightConstraint.constant = 48.0 * CGFloat(presenter.tableData.dataSource.count)
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
        radarView.startRadarAnimation()
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
        let cellIdentifier = "FindFoodTableCell"
        let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FindFoodTableViewCell
        cell.cellData = data as? LRCellData
        return cell
    }
    
}

extension FindFoodViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        switch state.currentAction {
        
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            radarView.startRadarAnimation()
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
        case is SearchInRangeAction:
            if presenter.isFirsTimeEntrance {
                presenter.isFirsTimeEntrance = false
                return
            }
            let action = state.currentAction as! SearchInRangeAction
            switch action.status {
            case .Success:
                radarView.stopRadarAnimation()
                if action.responseData?.count ?? 0 > 0 {
                    presenter.searchResults = action.responseData!
                    appStore.dispatch(markRangeSearchDataActions(queryData: action.responseData!))
                }
            case .Failed:
                radarView.stopRadarAnimation()
            default: break
            }
        case is MarkRangeSearchDataAction:
            let action = state.currentAction as! MarkRangeSearchDataAction
            radarView.stopRadarAnimation()
            if action.status == .Completed {
                MapNavigator.removeAllMapAnnotations(mapView: mkMapView)
                presenter.annotations.removeAll()
                presenter.annotations = action.annotations
                MapNavigator.displayAnnotations(mapView: mkMapView, annotations: presenter.annotations, animated: false)
            }
        default: break
        }
    }
    
}

extension FindFoodViewController: MKMapViewDelegate, UIGestureRecognizerDelegate {
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        if presenter.zoomStatus == .LevelChanged {
            presenter.zoomStatus = .None
            presenter.setMapZoomLevel(mapView: mapView,
                                      level: presenter.mapZoomLevel, center: presenter.centerCoordinate!)
        }
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        updateRangeValue()
        if presenter.isFirsTimeEntrance {
            return
        }
        if presenter.isRangeChanged(currentLevel: mapView.zoomLevel) {
            presenter.mapZoomLevel = mapView.zoomLevel
            if presenter.zoomStatus == .FingersTouched {
                presenter.zoomStatus = .LevelChanged
                clearApolloServiceCache()
                appStore.dispatch(SearchNearbyAction(center: mkMapView.camera.centerCoordinate,
                                                     range: presenter.searchRange(zoomLevel: mapView.zoomLevel)))
            }
        } else {
            presenter.zoomStatus = .None
        }
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
        if annotationViewTag == 0 {
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
            annotationView?.tag = annotationViewTag
            annotationViewTag += 1
        }
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
//        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        return annotationView
    }
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        annotationViewTag = 0
        if presenter.willMarkAnnotations {
            MapNavigator.setCenterCoordinate(mapView: mkMapView, coordinate: presenter.centerCoordinate!)
            presenter.willMarkAnnotations = false
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if presenter.searchResults.count > 0 {
            presenter.tableData.reloadData(data: presenter.searchResults[view.tag]!)
            tableView.reloadData()
//            tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
        }
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            if gestureRecognizer.numberOfTouches == 2 {
                presenter.zoomStatus = .FingersTouched
                return true
            }
            let distance =
                calculateCoordinateDistance(from: presenter.centerCoordinate!, to: mkMapView.camera.centerCoordinate)
            let searchingDistance = (presenter.searchRange(zoomLevel: mkMapView.zoomLevel)*1000)*2
            if distance > searchingDistance {
                clearApolloServiceCache()
                radarView.startRadarAnimation()
                let level = mkMapView.zoomLevel
                appStore.dispatch(SearchNearbyAction(center: mkMapView.camera.centerCoordinate, range: presenter.searchRange(zoomLevel: level)))
            }
            presenter.centerCoordinate = mkMapView.camera.centerCoordinate
        }
        return true
    }
}
