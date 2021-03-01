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
    @IBOutlet weak var collectionView: UICollectionView!
    private var scenario = FindFoodScenario()
    private var dataSource =
        [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]()
    @IBOutlet weak private var mkMapView: MKMapView!
    @IBOutlet weak private var radarView: RadarScanView!
    @IBOutlet weak private var rangeButton: UIButton!
    @IBOutlet weak private var locateButton: UIButton!
    private var annotationViewTag: Int = -1
    private var queryCount: Int = 0
    private var sceneVC: SceneViewController? = nil
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.layer.borderWidth = 2.0
        collectionView.layer.borderColor =
            UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 240.0/255.0, alpha: 1.0).cgColor
    }
    
    private func initialViewContorller() {
        mkMapView.delegate = self
        startRadarAnimating()
        scenario.beRequestCurrentLocation()
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
    
}

extension FindFoodViewController: SceneStateDelegate {
    func onNewState(state: SceneState) {
        switch state.currentAction {
        case is SearchInNewRangeAction:
            startRadarAnimating()
            scenario.beSearchNearby(
                mapCenter: CenterPoint(
                    coordinate: mkMapView.camera.centerCoordinate,
                    zoomLevel: mkMapView.zoomLevel))
        case let action as SearchForRangeAction:
            switch action.status {
            case .Success:
                stopRadarAnimating()
                if action.responseData?.count ?? 0 > 0 {
                    queryCount = action.responseData?.count ?? 0
                    scenario.beStoreQueryData(queryData: action.responseData!)
                    willMarkAnnotations = true
                    scenario.beMarkFoundPlacesOnMap(queryData: action.responseData!)
                } else {
                    scenario.beGetNewRegion { [self] (region) in
                        mkMapView.setRegion(region, animated: true)
                    }
                }
            case .Failed:
                stopRadarAnimating()
            default: break
            }
        case is GoGoogleNavigationAction:
            scenario.beCollectGoogleNavParcel { (place) in
                let url =
                    URL(string: "comgooglemaps://?saddr=&daddr=\(place.coordinate.latitude),\(place.coordinate.longitude)&directionsmode=driving")
                if UIApplication.shared.canOpenURL(url!) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                } else {
                    // 若手機沒安裝 Google Map App 則導到 App Store(id443904275 為 Google Map App 的 ID)
                    let appStoreGoogleMapURL = URL(string: "itms-apps://itunes.apple.com/app/id585027354")!
                    UIApplication.shared.open(appStoreGoogleMapURL, options: [:], completionHandler: nil)
                }
            }
            
        case let action as MarkFoundPlacesOnMapAction:
            mkMapView.removeAnnotations(mkMapView.annotations)
            mkMapView.addAnnotations(action.annotions)
            scenario.beGetNewRegion { [self] (region) in
                mkMapView.setRegion(region, animated: true)
                scenario.beGetCenterPoint {(centerPT) in
                    mkMapView.zoomLevel = centerPT.zoomLevel
                }
            }
        case let action as LocationsDynamicQueryAction:
            switch action.status {
            case .Success:
                if action.responseData?.count ?? 0 > 0 {
                    dataSource = action.responseData!
                    collectionView.reloadData()
                }
            default: break
            }
        default: break
        }
    }
    
}

extension FindFoodViewController: MKMapViewDelegate, UIGestureRecognizerDelegate {
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        updateRangeValue()
    }
    func mapView(
        _ mapView: MKMapView,rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
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
        /* 放置圖片
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
            scenario.beMoveMapCenterToCenterPoint(mapView: mapView)
            willMarkAnnotations = false
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        dataSource =
            [LocationsDynamicQueryQuery.Data.LocationsDynamicQuery?]()
        scenario.beDynamicQuerySelectedData(index: view.tag)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer {
            let gesture = gestureRecognizer as! UIPanGestureRecognizer
            if gesture.state == .ended {
                scenario.beSearchInNewRange(
                    mapCenter: CenterPoint(coordinate: mkMapView.camera.centerCoordinate, zoomLevel: mkMapView.zoomLevel))
            }
        }
        return true
    }
}

extension FindFoodViewController: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if dataSource.count == 0 {
            return 1
        }
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellIdentifier = "ShopCollectCell"
        if dataSource.count == 0 {
            cellIdentifier = "EmptyDataCell"
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "ShopCollectCell" {
            let data = dataSource[indexPath.row]
            (cell as! ShopCollectCell).cellTitleLabel.text =
                data?.shopBranch?.shop?.title
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize()
        if dataSource.count == 0 {
            cellSize.width = collectionView.bounds.size.width-16
            cellSize.height = collectionView.bounds.size.height
        } else {
            cellSize.width = collectionView.bounds.size.width/4.0
            cellSize.height = collectionView.bounds.size.height/2.0
        }
        return cellSize
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        switch cell {
        case is ShopCollectCell :
            let data = dataSource[indexPath.row]
            scenario.beSendGourmetDetailParcel(content: data!)
            let presentVC =
                self.storyboard?.instantiateViewController(identifier: "GourmetDetailViewController")
            sceneVC?.basePresentViewController(presentVC!, Animated: true)
            
        default: break
        }
    }
}
