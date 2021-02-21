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
    private var sceneVC: SceneViewController? = nil
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
        collectionView.reloadData()
    }
}
extension FoundLocViewController: UICollectionViewDelegate,
                                  UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoundLocCollectCell", for: indexPath) as! FoundLocCollectCell
        let data = dataSource[indexPath.row]
        cell.cellMiddleLabel.text = data.shop.title
        cell.cellBottomLabel.text = data.shopBranch.name
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = collectionView.bounds.size.width/3.0
        return CGSize(width: cellSize, height: cellSize)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
