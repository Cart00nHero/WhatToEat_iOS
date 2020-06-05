//
//  DateUtil.swift
//  WhatToEat
//
//  Created by YuCheng on 2020/5/30.
//  Copyright © 2020 YuCheng. All rights reserved.
//

import UIKit

func convertDateToUTC_ISO8601DateString(date: Date) -> String {
    // The default timeZone for ISO8601DateFormatter is UTC
    let utcISODateFormatter = ISO8601DateFormatter()
    return utcISODateFormatter.string(from: date)
}
func convertDateToUTCString(date: Date, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let utcDateFormatter = DateFormatter()
    utcDateFormatter.dateStyle = dateStyle
    utcDateFormatter.timeStyle = timeStyle
    utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    return utcDateFormatter.string(from: date)
}
// UTC YYYY-MM-DDTHH:mm:ss.sssZ
func convertToUTC(dateToConvert:String) -> String {
    let formatter = DateFormatter()
//    formatter.dateFormat = "dd-MM-yyyy hh:mm a"
    formatter.dateFormat = "YYYY-MM-DDTHH:mm:ss.sssZ"
    let convertedDate = formatter.date(from: dateToConvert)
    formatter.timeZone = TimeZone(identifier: "UTC")
    return formatter.string(from: convertedDate!)
    
}
func convertDateToString(_ date:Date, dateFormat: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    let dateString = formatter.string(from: date)
    return dateString
}
func convertStringToDate(toDate dateString: String?, formatter: String?) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter
    return dateFormatter.date(from: dateString ?? "")
}
