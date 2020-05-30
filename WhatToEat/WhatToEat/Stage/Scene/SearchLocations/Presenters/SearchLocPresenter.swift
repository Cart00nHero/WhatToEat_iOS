//
//  SearchLocPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/26.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit
import ReSwift
import MapKit

class SearchLocPresenter: NSObject {
    enum SearchMode {
        case MapLocation, Google
    }
    
    var searchMode: SearchMode = .MapLocation
    var isWebViewCreated = false
    let newShopObj = ShopObj()
    lazy var addressParcel = ParcelObject()
    
    func googleSearchUrl(queryText: String) -> String {
        let query = queryText.replacingOccurrences(of: " ", with: "+")
        let url = "https://www.google.co.in/search?q=" + query
        return url
    }
    func createCoverView(coverSuperView: UIView) -> UIView {
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
    @objc private func coverViewTapGesture(sender: UITapGestureRecognizer) {
        appStore.dispatch(ReceivedTapAction(tapGesture: sender))
    }
    @objc func setViewDefaultStyle(selectView: UIView) {
        selectView.layer.borderWidth = 0.0
        selectView.layer.borderColor = normalBgColor().cgColor
    }
    func setViewSelectedStyle(selectView: UIView) {
        selectView.layer.borderWidth = 2.0
        selectView.layer.borderColor = selectedBgColor().cgColor
    }
    func normalBgColor() -> UIColor {
        return UIColor(red: 245/255.0, green: 255/255.0, blue: 250/255.0, alpha: 1.0)
    }
    func selectedBgColor() -> UIColor {
        return UIColor.red
    }
    
}
