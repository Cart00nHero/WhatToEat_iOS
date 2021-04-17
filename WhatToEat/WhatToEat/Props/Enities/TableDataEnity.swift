//
//  TableDataEnity.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/16.
//

import Foundation

struct GourmetsTableData {
    var inputObj: GQInputObject
    var dataSource: Array<Array<TemplateProtocol>> = []
    init(address: GQInputObject) {
        self.inputObj = address
        dataSource = createDataSource()
    }
    let sectionTitles : Array<String> = ["店家資訊","地點"]
    private func createDataSource() -> Array<Array<TemplateProtocol>> {
        return [
            [
                LRTemplate(leftViewItem: LabelItem(text: "名稱"), rightViewItem: TextFieldItem(text: self.inputObj.shopBranch.title)),
                LRTemplate(leftViewItem: LabelItem(text: "副標題"), rightViewItem: TextFieldItem(text: (self.inputObj.shopBranch.subtitle ?? "") ?? "")),
                LRTemplate(
                    leftViewItem: LabelItem(text: "均消價"),
                    rightViewItem: TextFieldItem(
                        keyboardType: .decimalPad,text: String(format: "%.1f", self.inputObj.shopBranch.underPrice!!))),
                LRTemplate(
                    leftViewItem: LabelItem(text: "電話"),
                    rightViewItem: TextFieldItem(keyboardType: .phonePad, text: (inputObj.shopBranch.tel ?? "") ?? ""))
            ],
            [
                LRTemplate(leftViewItem: LabelItem(text: "地址"),
                               rightViewItem: LabelItem(numberOfLines: 2, text: inputObj.address.completeInfo),
                           itemHeight: 84.0
                ),
                LRTemplate(
                    leftViewItem: LabelItem(text: "樓層"),
                    rightViewItem: TextFieldItem(keyboardType: .numberPad,
                        text: (self.inputObj.address.floor ?? "") ?? "")),
                LRTemplate(leftViewItem: LabelItem(text: "室"), rightViewItem: TextFieldItem(keyboardType: .numberPad,text: (self.inputObj.address.room ?? "") ?? "")),
                ButtonTemplate(cornerRadius: 2.0, titleText: "分享至地圖")
            ]
        ]
    }
}

struct DetailTableData {
    var dataObj:
        LocationsDynamicQueryQuery.Data.LocationsDynamicQuery
    var dataSource: Array<TemplateProtocol> = []
    init(dataObj: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) {
        self.dataObj = dataObj
        dataSource = createDataSource()
    }
    mutating func reloadData(
        data: LocationsDynamicQueryQuery.Data.LocationsDynamicQuery) {
        self.dataObj = data
        dataSource = createDataSource()
    }
    private func createDataSource() -> Array<TemplateProtocol> {
        return [
            LRTemplate(
                leftViewItem: LabelItem(text: "名稱"),
                rightViewItem: LabelItem(
                    text: (dataObj.shopBranch?.title ?? "") )),
            LRTemplate(
                leftViewItem: LabelItem(text: "副標題"),
                rightViewItem: LabelItem(
                    text: (dataObj.shopBranch?.subtitle ?? "") )),
            LRTemplate(
                leftViewItem: LabelItem(text: "均消價"),
                rightViewItem: LabelItem(text:String(format: "%.1f", (self.dataObj.shopBranch?.underPrice ?? 0.0)!))),
            LRTemplate(
                leftViewItem: LabelItem(text: "電話"),rightViewItem: LabelItem(text: (dataObj.shopBranch?.tel ?? "") )),
            LRTemplate(leftViewItem: LabelItem(text: "地址"),
                           rightViewItem: LabelItem(text: dataObj.completeInfo ?? "")),
            ButtonTemplate(cornerRadius: 2.0, titleText: "帶我去")
        ]
    }
}
