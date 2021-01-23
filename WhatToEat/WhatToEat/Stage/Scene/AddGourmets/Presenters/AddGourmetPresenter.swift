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
    var dataSource: Array<Array<TemplateProtocol>> = []
    init(address: GQInputObject) {
        self.inputObj = address
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    private func createDataSource() -> Array<Array<TemplateProtocol>> {
        return [
            [
                LRCellTemplate(leftViewItem: LabelItem(text: "Title"),
                               rightViewItem: TextFieldItem(text: self.inputObj.shop.title)),
                LRCellTemplate(leftViewItem: DropDownItem(placeHolder:"Style", optionArray: DropDownMenuData().styleSource,
                                                                selectedText: (self.inputObj.shop.style ?? "") ?? ""),
                               rightViewItem: DropDownItem(placeHolder:"Type",
                                                                 optionArray: DropDownMenuData().typeSource,
                                                                 selectedText: (self.inputObj.shop.type ?? "") ?? "")),
                LRCellTemplate(leftViewItem: LabelItem(text: "Under\nPrice"),
                               rightViewItem: TextFieldItem(keyboardType: .decimalPad,
                                                                  text: String(format: "%.2f", self.inputObj.shop.underPrice)))
            ],
            [
                LRCellTemplate(leftViewItem: LabelItem(text: "Name"), rightViewItem: TextFieldItem(text: self.inputObj.shopBranch.name)),
                LRCellTemplate(leftViewItem: LabelItem(text: "Tel"),
                               rightViewItem: TextFieldItem(keyboardType: .phonePad, text: (inputObj.shopBranch.tel ?? "") ?? ""))
            ],
            [
                LRCellTemplate(leftViewItem: LabelItem(text: "Address"),
                               rightViewItem: LabelItem(numberOfLines: 2, text: inputObj.address.completeInfo),
                           itemHeight: 84.0
                ),
                LRCellTemplate(leftViewItem: LabelItem(text: "Floor"), rightViewItem: TextFieldItem(text: (self.inputObj.address.floor ?? "") ?? "")),
                LRCellTemplate(leftViewItem: LabelItem(text: "Room"), rightViewItem: TextFieldItem(text: (self.inputObj.address.room ?? "") ?? "")),
                BtnCellTemplate(cornerRadius: 2.0, titleText: "Save")
            ]
        ]
    }
}

struct DropDownMenuData
{
    let typeSource = ["Unclassified",
                      "Breakfast","Boxed meal",
                      "Buffet","Cafe","Cafeteria","Diner","Fast food",
                      "Prix fixe","Pizzeria"]
    let styleSource = ["Unclassified","AFR","EURO","LAME",
                       "CHN","DEU","ESP","GBR","FRA","HKG",
                       "IND","JPN","KOR","MEX","THA",
                       "TWN","USA","VNM"]
}
