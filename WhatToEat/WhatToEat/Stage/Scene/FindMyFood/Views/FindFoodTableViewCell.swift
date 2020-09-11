//
//  FindFoodTableViewCell.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/7/19.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import MapKit

class FindFoodTableViewCell: LRTableViewCell {
    
    @IBOutlet weak var cellLeftLabel: UILabel!
    private var leftContentView: UIView? = nil
    private var rightContentView: UIView? = nil
    private var mkCircle: MKCircle? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if leftContentView != nil {
            leftContentView?.removeFromSuperview()
        }
        for subView in cellRightView.subviews {
            subView.removeFromSuperview()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        createLeftView()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func createLeftView() {
        let data = cellData!.leftCellProtocol as? LRLabelCellData
        cellLeftLabel.text = data?.labelText
    }
    
}

// MARK: - RadarMapTableViewCell
class RadarMapTableViewCell: UITableViewCell, MKMapViewDelegate {
    
    @IBOutlet weak var mkMapView: MKMapView!
    @IBOutlet weak private var radarView: RadarScanView!
    @IBOutlet weak private var rangeButton: UIButton!
    private var annotationViewTag: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mkMapView.delegate = nil
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(receivePanGestureRecognizer(sender:)))
        mkMapView.addGestureRecognizer(panGesture)
        mkMapView.delegate = self
        appStore.dispatch(TableCellDidLayoutSubviewsAction(cell: self))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func showCircle(coordinate: CLLocationCoordinate2D,radius: CLLocationDistance) {
        // Radius is measured in meters
        if mkMapView.overlays.count > 0 {
            mkMapView.removeOverlays(mkMapView.overlays)
        }
        let circle = MKCircle(center: coordinate,radius: radius)
        mkMapView.addOverlay(circle)
    }
    private func regionDistance(zoomLevel: Int) -> Float64 {
        if zoomLevel >= 17 {
            return 400.0
        }
        
        if zoomLevel == 16 {
            return 1000.0
        }
        if zoomLevel <= 15 {
            return 2000.0
        }
        return 1000.0
    }
    // MARK: - Public Methods
    func startRadarScanning() {
        radarView.isUserInteractionEnabled = true
        radarView.startRadarAnimation()
    }
    func stopRadarScanning() {
        radarView.isUserInteractionEnabled = false
        radarView.stopRadarAnimation()
    }
    func setCenterCoordinate(coordinate: CLLocationCoordinate2D) {
        mkMapView.centerCoordinate = coordinate
    }
    func centerCoordinate() -> CLLocationCoordinate2D {
        return mkMapView.camera.centerCoordinate
    }
    
    func updateRangeValue() {
        let zoomLevel = mkMapView.zoomLevel
        if zoomLevel >= 17 {
            rangeButton.setTitle("0.2KM", for: .normal)
            return
        }
        
        if zoomLevel == 16 {
            rangeButton.setTitle("0.5KM", for: .normal)
            return
        }
        if zoomLevel <= 15 {
            rangeButton.setTitle("1.0KM", for: .normal)
            return
        }
    }
    func setMapZoomLevel(level: Int,center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion( center: center,
                                         latitudinalMeters: CLLocationDistance(exactly: regionDistance(zoomLevel: level))!,
                                         longitudinalMeters: CLLocationDistance(exactly: regionDistance(zoomLevel: level))!)
        mkMapView.setRegion(mkMapView.regionThatFits(region), animated: true)
    }
    func mapZoomLevel() -> Int {
        return mkMapView.zoomLevel
    }
    func showCircleOverlay(radius: CLLocationDistance) {
        showCircle(coordinate: mkMapView.camera.centerCoordinate, radius: radius)
    }
    func showAnnotationsOnMap(annotations: [MKPointAnnotation], animated: Bool) {
        mkMapView.showAnnotations(annotations, animated: animated)
    }
    
    func removeAllMapAnnotations(annotations: [MKPointAnnotation]) {
        mkMapView.removeAnnotations(annotations)
    }
    
    
    // MARK: - UI Actions
    @IBAction func locateButtonClickAction(_ sender: UIButton) {
        startRadarScanning()
        appStore.dispatch(TableCellButtonClickAction(cell: self, button: sender))
    }
    @objc private func receivePanGestureRecognizer(sender: UIPanGestureRecognizer) {
        appStore.dispatch(UIPanGestureRecognizerAction(sender: sender))
    }
    // MARK: - Gesture Delegate
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UILongPressGestureRecognizer {
            appStore.dispatch(ReceivedGestureRecognizerAction(sender: gestureRecognizer))
        }
        return true
    }
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        appStore.dispatch(RegionWillChangeAction())
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        appStore.dispatch(MapRegionDidChangeAction())
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        appStore.dispatch(MapDidChangeVisibleRegionAction())
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
            appStore.dispatch(MapWillAddAnnotationsAction())
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
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
//        leftIconView.image = UIImage(named: restaurant.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        annotationViewTag += 1
        annotationView?.tag = annotationViewTag
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
    //        var viewTag = 0
    //        for view in views {
    //            view.tag = viewTag
    //            viewTag += 1
    //            view.displayPriority = .defaultLow
    //        }
            annotationViewTag = 0
            appStore.dispatch(MapDidAddAnnotationsAction())
        }
}
