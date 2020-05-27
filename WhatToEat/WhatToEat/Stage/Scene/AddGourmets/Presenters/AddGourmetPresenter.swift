//
//  AddGourmetPresenter.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/16.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

struct GourmetsTableData {
    
    let sectionTitles : Array<String> = ["Shop","Branch","Location"]
    var dataSource: Array<Array<CellDataProtocol>> = [
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource), rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource)),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"), rightCellProtocol: LRTextFieldCellData(keyboardType: .decimalPad))
        ],
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"), rightCellProtocol: LRRangeCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"), rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad))
        ],
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Address"), rightCellProtocol: LRLabelCellData(cellHeight: 64.0, numberOfLines: 0, labelText: "新北市永和區信義路20號")),
            ButtonCellData(cornerRadius: 2.0, titleText: "Save")
        ]
    ]
}

struct DropDownMenuData
{
    let typeSource = ["None","Order","Cafeteria","Prix fixe",
                      "Buffet","Diner","Cafe","Fast food","Pizzeria"]
    let styleSource = ["TW","JPN","USA","Thai"]
}
