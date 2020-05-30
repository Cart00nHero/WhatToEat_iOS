//
//  AddGourmetPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/16.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGourmetPresenter: NSObject {
    lazy var newShop = Shop(branches: [ShopBranch(address: Address())])
    func combineAddressCompleteInfo(address: Address) -> String {
        let mutabletext = NSMutableString(string: address.administrativeArea ?? "")
        mutabletext.append(address.subAdministrativeArea ?? "")
        mutabletext.append(address.locality ?? "")
        mutabletext.append(address.thoroughfare ?? "")
        mutabletext.append(" ")
        mutabletext.append(address.subThoroughfare ?? "")
        return mutabletext as String
    }
    
    func updateTextFieldInputData(newText: String, indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                newShop.title = newText
            case 2:
                newShop.underPrice = Float64(newText) ?? 0.0
            default: break
            }
            return
        }
        if indexPath.section == 1 {
            var branch = newShop.branches[0]
            switch indexPath.row {
            case 0:
                branch.name = newText
            case 2:
                branch.tel = newText
            default: break
            }
            newShop.branches = [branch]
            return
        }
    }
}
struct GourmetsTableData {
    let shopData: Shop
    var dataSource: Array<Array<CellDataProtocol>> = []
    init(shopData: Shop) {
        self.shopData = shopData
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    func createDataSource() -> Array<Array<CellDataProtocol>> {
        let branch = shopData.branches[0]
        let address = branch.address
        
        return [
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"),
                           rightCellProtocol: LRTextFieldCellData(inputText: shopData.title ?? "")),
                LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource, selectedText: shopData.style ?? ""),
                           rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource,selectedText: shopData.type ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"), rightCellProtocol: LRTextFieldCellData(keyboardType: .decimalPad,inputText: String(format: "%.2f", shopData.underPrice)))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"),
                           rightCellProtocol: LRRangeCellData(starDate: branch.openTime ?? Date(), endDate: branch.closeTime ?? Date())),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"),
                           rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad, inputText: branch.tel ?? ""))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Address"),
                           rightCellProtocol: LRLabelCellData(cellHeight: 64.0, numberOfLines: 0, labelText: address.completeInfo ?? "")),
                ButtonCellData(cornerRadius: 2.0, titleText: "Save")
            ]
        ]
    }
}

struct DropDownMenuData
{
    let typeSource = ["Breakfast","Boxed meal","Cafeteria","Prix fixe",
                      "Buffet","Diner","Cafe","Fast food","Pizzeria"]
    let styleSource = ["TW","JPN","USA","Thai"]
}
