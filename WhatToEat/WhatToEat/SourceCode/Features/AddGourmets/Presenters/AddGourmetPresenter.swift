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
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Title"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Type"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Style"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Under Price"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField))
        ],
        [
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Name"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Business Hours"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Tel"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField))
        ],
        [
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Nation"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "State"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "City/County"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "District"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Town"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Road/Street"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField)),
            LRCellData(templateStyle: .LeftRight, leftCellProtocol: LRTextLabelCell(cellStyle: .TextLabel, labelText: "Remain Info"), rightCellProtocol: LRTextFieldCell(cellStyle: .TextField))
        ]
    ]
    
    
}
