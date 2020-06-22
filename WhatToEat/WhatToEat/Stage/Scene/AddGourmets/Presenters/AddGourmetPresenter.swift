//
//  AddGourmetPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/16.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGourmetPresenter: NSObject {
//    lazy var newShop = Shop(branches: [ShopBranch(address: Address())])
    lazy var newAddress = getInitGQAddress()
//    lazy var newAddress = GQAddress(shopBranch: InputBranch(closedTime: "", name: "", openTime: "", shop: InputShop(), tel: ""))
    
    func updateTextFieldInputData(newText: String, indexPath: IndexPath) {
        var newShop = newAddress.shopBranch.shop
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                newShop.title = newText
            case 2:
                newShop.underPrice = Float64(newText) ?? 0.0
            default: break
            }
            newAddress.shopBranch.shop = newShop
            return
        }
        if indexPath.section == 1 {
            var branch = newAddress.shopBranch
            switch indexPath.row {
            case 0:
                branch.name = newText
            case 2:
                branch.tel = newText
            default: break
            }
            newAddress.shopBranch = branch
            return
        }
    }
    func combineAddressFullInfo() -> String {
        let newShop = newAddress.shopBranch.shop
        let mutableText = NSMutableString(string: newShop.title )
        let branch = newAddress.shopBranch
        mutableText.append(branch.name)
        mutableText.append(newAddress.address.completeInfo)
        return mutableText as String
    }
}
struct GourmetsTableData {
    var address: GQAddress
    var dataSource: Array<Array<CellDataProtocol>> = []
    init(address: GQAddress) {
        self.address = address
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    func createDataSource() -> Array<Array<CellDataProtocol>> {
        return [
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"),
                           rightCellProtocol: LRTextFieldCellData(inputText: self.address.shopBranch.shop.title)),
                LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource,
                                                                selectedText: (self.address.shopBranch.shop.style ?? "") ?? ""),
                           rightCellProtocol: LRDropDownCellData(placeHolder:"Type",
                                                                 optionArray: DropDownMenuData().typeSource,
                                                                 selectedText: (self.address.shopBranch.shop.type ?? "") ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"),
                           rightCellProtocol: LRTextFieldCellData(keyboardType: .decimalPad,
                                                                  inputText: String(format: "%.2f", self.address.shopBranch.shop.underPrice)))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"),
                           rightCellProtocol: LRRangeCellData(starDate: convertStringToUTC_ISO8601Date(dateString: (address.shopBranch.openTime ?? "") ?? ""),
                                                              endDate: convertStringToUTC_ISO8601Date(dateString: (address.shopBranch.closedTime ?? "") ?? ""))),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"),
                           rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad, inputText: (address.shopBranch.tel ?? "") ?? ""))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Address"),
                           rightCellProtocol: LRLabelCellData(cellHeight: 64.0, numberOfLines: 0, labelText: address.address.completeInfo)),
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
