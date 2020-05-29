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
    
    func setNewtableData(dataSource: Array<Array<CellDataProtocol>>) {
        // shop
        var newData = dataSource
        newData[0][0] = LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"), rightCellProtocol: LRTextFieldCellData(inputText: newShop.title ?? ""))
        newData[0][1] = LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource), rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource, selectedText: newShop.style ?? ""))
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
        return [
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"), rightCellProtocol: LRTextFieldCellData(inputText: shopData.title ?? "")),
                LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource, selectedText: shopData.style ?? ""),
                           rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource,selectedText: shopData.type ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"), rightCellProtocol: LRTextFieldCellData(keyboardType: .decimalPad,inputText: String(format: "%.2f", shopData.underPrice)))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"), rightCellProtocol: LRRangeCellData()),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"), rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Address"), rightCellProtocol: LRLabelCellData(cellHeight: 64.0, numberOfLines: 0, labelText: "")),
                ButtonCellData(cornerRadius: 2.0, titleText: "Save")
            ]
        ]
    }
}

struct DropDownMenuData
{
    let typeSource = ["None","Order","Cafeteria","Prix fixe",
                      "Buffet","Diner","Cafe","Fast food","Pizzeria"]
    let styleSource = ["TW","JPN","USA","Thai"]
}
