//
//  DateUtil.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/30.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func parseDateToString(_ date:Date, dateFormat: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    let dateString = formatter.string(from: date)
    return dateString
}
func parseStringToDate(toDate dateString: String?, formatter: String?) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter
    return dateFormatter.date(from: dateString ?? "")
}
