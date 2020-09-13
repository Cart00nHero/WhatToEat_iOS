//
//  FindFoodViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/11.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class FindFoodViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    private var defaultTemplate: DefaultVCTemplate? = nil
    private lazy var presenter: FindFoodPresenter = FindFoodPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocationMaster.shared.requestAuthorization(.REQUEST_AUTHORIZATION_WHENINUSE)
        LocationMaster.shared.setAccuracyAndDistanceFilter(100.0, accuracy: .ACCURACY_BEST_FOR_NAVIGATION)
        LocationMaster.shared.requestCurrentLocation()
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
    
    // MARK: - UI Actions
    @objc private func rigtBarButtonClickAction(sender: UIBarButtonItem) {
        
    }
    
}

extension FindFoodViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.tableData.dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = presenter.tableData.dataSource[indexPath.section][indexPath.row]
        var cellIdentifier = "RadarMapCell"
        if data.templateStyle == .LeftRight {
            cellIdentifier = "FindFoodTableCell"
        }
        let cell =
            tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "RadarMapCell" {
            let contentCell = cell as? RadarMapTableViewCell
            contentCell?.startRadarScanning()
        }else {
            let contentCell = cell as? FindFoodTableViewCell
            contentCell?.cellData = data as? LRCellData
        }
        return cell
    }
    
}

extension FindFoodViewController: DefaultTemplateDelegate {
    func receiveNewState(state: DefaultTemplateState) {
        switch state.currentAction {
        case is TableCellDidLayoutSubviewsAction:
            let action = state.currentAction as! TableCellDidLayoutSubviewsAction
            presenter.searchMapCell = action.cell as? RadarMapTableViewCell
        case is TableCellButtonClickAction:
            LocationMaster.shared.requestCurrentLocation()
        case is LocatePositionAction:
            let action = state.currentAction as! LocatePositionAction
            switch action.status {
            case .DidUpdateLocation:
                if action.locations?.count ?? 0 > 0 {
                    presenter.currentLoc = action.locations?.first
                    presenter.centerCoordinate = presenter.currentLoc?.coordinate
                    presenter.searchMapCell?.setMapZoomLevel(level: 16, center: presenter.centerCoordinate!)
                    appStore.dispatch(SearchNearbyAction(center: presenter.centerCoordinate!,
                                                         range: presenter.searchRange(zoomLevel: 16)))
                }
            default: break
            }
        case is SearchInRangeAction:
            let action = state.currentAction as! SearchInRangeAction
            switch action.status {
            case .Success:
                presenter.searchMapCell?.stopRadarScanning()
                if action.responseData?.count ?? 0 > 0 {
                    presenter.searchResults = action.responseData!
                    appStore.dispatch(markRangeSearchDataActions(queryData: action.responseData!))
                }
            case .Failed:
                presenter.searchMapCell?.stopRadarScanning()
            default: break
            }
        case is MarkRangeSearchDataAction:
            let action = state.currentAction as! MarkRangeSearchDataAction
            presenter.searchMapCell?.stopRadarScanning()
            if action.status == .Completed {
                presenter.annotations = action.annotations
                presenter.searchMapCell?.showAnnotationsOnMap(annotations: action.annotations, animated: false)
            }
        case is MapWillAddAnnotationsAction:
            presenter.willMarkAnnotations = true
        case is MapDidAddAnnotationsAction:
            if presenter.willMarkAnnotations {
                presenter.searchMapCell?.setCenterCoordinate(coordinate: presenter.centerCoordinate!)
                presenter.willMarkAnnotations = false
            }
        case is ReceivedGestureRecognizerAction:
            if presenter.isNeedUpdating() {
                presenter.searchMapCell?.startRadarScanning()
                let level = presenter.searchMapCell?.mapZoomLevel() ?? 16
                appStore.dispatch(SearchNearbyAction(center: (presenter.searchMapCell?.centerCoordinate())!,
                                                     range: presenter.searchRange(zoomLevel: level)))
                presenter.centerCoordinate = presenter.searchMapCell?.centerCoordinate()
            }
        case is MapDidChangeVisibleRegionAction:
            presenter.searchMapCell?.updateRangeValue()
            if presenter.isFirsTimeEntrance {
                presenter.isFirsTimeEntrance = false
                return
            }
            if presenter.searchMapCell?.mapZoomLevel() != presenter.mapZoomLevel {
                let level = presenter.searchMapCell?.mapZoomLevel() ?? 16
                appStore.dispatch(SearchNearbyAction(center: (presenter.searchMapCell?.centerCoordinate())!,
                                                     range: presenter.searchRange(zoomLevel: level)))
                presenter.mapZoomLevel = level
            }
        case is MKAnnotationDidSelectAction:
            let action = state.currentAction as! MKAnnotationDidSelectAction
            if presenter.searchResults.count > 0 {
                presenter.tableData.reloadData(data: presenter.searchResults[action.selectedIndex]!)
                tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
            }
        default: break
        }
    }
    
}
