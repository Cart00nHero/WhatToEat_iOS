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
    let dataSource: Array<Array<CellDataProtocol>> = [
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Title"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRDropDownCellData(placeHolder:"Style", optionArray: DropDownMenuData().styleSource), rightCellProtocol: LRDropDownCellData(placeHolder:"Type",optionArray: DropDownMenuData().typeSource)),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Under\nPrice"), rightCellProtocol: LRTextFieldCellData(keyboardType: .numberPad))
        ],
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Name"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Business\nHours"), rightCellProtocol: LRRangeCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Tel"), rightCellProtocol: LRTextFieldCellData(keyboardType: .phonePad))
        ],
        [
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Nation"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "State"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "City/County"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "District"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Town"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Road/Street"), rightCellProtocol: LRTextFieldCellData()),
            LRCellData(leftCellProtocol: LRLabelCellData(labelText: "Remain Info"), rightCellProtocol: LRTextFieldCellData()),
            ButtonCellData(cornerRadius: 2.0, titleText: "儲存")
        ]
    ]
}

struct DropDownMenuData
{
    let typeSource = ["None","Order","Cafeteria","Prix fixe",
                      "Buffet","Diner","Cafe","Fast food","Pizzeria"]
    let styleSource = ["TW","JPN","USA","Thai"]
}
