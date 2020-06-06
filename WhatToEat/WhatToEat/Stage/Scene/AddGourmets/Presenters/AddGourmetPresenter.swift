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
    lazy var newAddress = GQAddress(shopBranch: InputBranch(shop:InputShop()))
    func combineAddressCompleteInfo(address: GQAddress) -> String {
        let mutabletext = NSMutableString(string: address.administrativeArea ?? "")
        mutabletext.append(address.subAdministrativeArea ?? "")
        mutabletext.append(address.locality ?? "")
        mutabletext.append(address.thoroughfare ?? "")
        mutabletext.append(" ")
        mutabletext.append(address.subThoroughfare ?? "")
        return mutabletext as String
    }
    
    func updateTextFieldInputData(newText: String, indexPath: IndexPath) {
        var newShop = newAddress.shopBranch.shop ?? InputShop()
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                newShop?.title = newText
            case 2:
                newShop?.underPrice! = Float64(newText) ?? 0.0
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
        let newShop = newAddress.shopBranch.shop ?? InputShop()
        let mutableText = NSMutableString(string: newShop?.title! ?? "")
        let branch = newAddress.shopBranch
        mutableText.append(branch.name! ?? "")
        mutableText.append(newAddress.completeInfo ?? "")
        return mutableText as String
    }
}
struct GourmetsTableData {
    let address: GQAddress
    private var shopData: InputShop
    var dataSource: Array<Array<CellDataProtocol>> = []
    init(address: GQAddress) {
        self.address = address
        shopData = address.shopBranch.shop! ?? InputShop()
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    func createDataSource() -> Array<Array<CellDataProtocol>> {
        let branch = address.shopBranch
        return [
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"),
                           rightCellProtocol: LRTextFieldCellData(inputText: shopData.title! ?? "")),
                LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource, selectedText: shopData.style! ?? ""),
                           rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource,selectedText: shopData.type! ?? "")),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"), rightCellProtocol: LRTextFieldCellData(keyboardType: .decimalPad,inputText: String(format: "%.2f", shopData.underPrice! ?? 0.0)))
            ],
            [
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"),
                           rightCellProtocol: LRRangeCellData(starDate: convertStringToUTC_ISO8601Date(dateString: branch.openTime! ?? ""), endDate: convertStringToUTC_ISO8601Date(dateString: branch.closedTime! ?? ""))),
                LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"),
                           rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad, inputText: branch.tel! ?? ""))
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
