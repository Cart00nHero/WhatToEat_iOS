//
//  AddGourmetPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/16.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

class AddGourmetPresenter: NSObject {
    
    lazy var newLoc = initGQInputObject()
    var saveToUpload = false
    
    func updateTextFieldInputData(newText: String, indexPath: IndexPath) {
        var newShop = newLoc.shop
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                newShop.title = newText
            case 2:
                newShop.underPrice = Float64(newText) ?? 0.0
            default: break
            }
            newLoc.shop = newShop
            return
        }
        if indexPath.section == 1 {
            var branch = newLoc.shopBranch
            switch indexPath.row {
            case 0:
                branch.name = newText
            case 2:
                branch.tel = newText
            default: break
            }
            newLoc.shopBranch = branch
            return
        }
    }
    func combineAddressFullInfo() -> String {
        let newShop = newLoc.shop
        let mutableText = NSMutableString(string: newShop.title )
        let branch = newLoc.shopBranch
        mutableText.append(branch.name)
        mutableText.append(newLoc.address.completeInfo)
        return mutableText as String
    }
}
struct GourmetsTableData {
    var inputObj: GQInputObject
    var dataSource: Array<Array<CellTemplateProtocol>> = []
    init(address: GQInputObject) {
        self.inputObj = address
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    private func createDataSource() -> Array<Array<CellTemplateProtocol>> {
        return [
            [
                LRCellTemplate(leftProtocol: LabelCell(text: "Title"),
                           rightProtocol: TextFieldCell(text: self.inputObj.shop.title)),
                LRCellTemplate(leftProtocol: DropDownCell(placeHolder:"Style", optionArray: DropDownMenuData().styleSource,
                                                                selectedText: (self.inputObj.shop.style ?? "") ?? ""),
                           rightProtocol: DropDownCell(placeHolder:"Type",
                                                                 optionArray: DropDownMenuData().typeSource,
                                                                 selectedText: (self.inputObj.shop.type ?? "") ?? "")),
                LRCellTemplate(leftProtocol: LabelCell(text: "Under\nPrice"),
                           rightProtocol: TextFieldCell(keyboardType: .decimalPad,
                                                                  text: String(format: "%.2f", self.inputObj.shop.underPrice)))
            ],
            [
                LRCellTemplate(leftProtocol: LabelCell(text: "Name"), rightProtocol: TextFieldCell(text: self.inputObj.shopBranch.name)),
                LRCellTemplate(leftProtocol: LabelCell(text: "Business\nHours"),
                           rightProtocol: RangeCell(starDate: convertStringToUTC_ISO8601Date(dateString: (inputObj.shopBranch.openTime ?? "") ?? ""),
                                                              endDate: convertStringToUTC_ISO8601Date(dateString: (inputObj.shopBranch.closedTime ?? "") ?? ""))),
                LRCellTemplate(leftProtocol: LabelCell(text: "Tel"),
                           rightProtocol: TextFieldCell(keyboardType: .phonePad, text: (inputObj.shopBranch.tel ?? "") ?? ""))
            ],
            [
                LRCellTemplate(leftProtocol: LabelCell(text: "Address"),
                           rightProtocol: LabelCell(cellHeight: 64.0, numberOfLines: 0, text: inputObj.address.completeInfo)),
                BtnCellTemplate(cornerRadius: 2.0, titleText: "Save")
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
