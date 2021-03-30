//
//  FoundLocViewController.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/2/20.
//  Copyright © 2021 YuCheng. All rights reserved.
//

import Foundation
import UIKit

class FoundLocViewController: UIViewController {
    private var scenario: FoundLocScenario = FoundLocScenario()
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource = [GQInputObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scenario.beCollectParcel { [self] (source) in
            dataSource = source
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let inputData = dataSource.last
        addressLabel.text = inputData?.address.completeInfo
        collectionView.reloadData()
    }
}
extension FoundLocViewController: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cellIdentifier = "ShopCollectCell"
        if indexPath.row == dataSource.count {
            cellIdentifier = "AddShopCollectCell"
        }
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: cellIdentifier, for: indexPath)
        if cellIdentifier == "ShopCollectCell" {
            let data = dataSource[indexPath.row]
            let titleText: String =
                (data.shopBranch.subtitle as? String) ?? ""
            if titleText.count > 0 {
                (cell as! ShopCollectCell)
                    .cellTitleLabel.text = titleText
            } else {
                (cell as! ShopCollectCell)
                    .cellTitleLabel.text = data.shopBranch.title
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = (collectionView.bounds.size.width)/3.0
        return CGSize(width: cellSize, height: cellSize+30)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        switch cell {
        case is ShopCollectCell :
            let data = dataSource[indexPath.row]
            scenario.bePackageParcel(inputObj: data)
        case is AddShopCollectCell :
            let data = dataSource.last ?? initGQInputObject()
            scenario.bePrepareNewParcel(inputObj: data)
        default: break
        }
        self.dismiss(animated: true) {
            appStore.dispatch(GoAddGourmetScenarioAction())
        }
    }
}
