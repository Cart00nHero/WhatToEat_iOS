//
//  DateExtesion.swift
//  WhatToEat
//
//  Created by YuCheng on 2021/3/30.
//

import Foundation

extension Date {
    func toUTC_ISO8601Text() -> String {
        // The default timeZone for ISO8601DateFormatter is UTC
        let utcISODateFormatter = ISO8601DateFormatter()
        return utcISODateFormatter.string(from: self)
    }
    func toUTCText(dateStyle: DateFormatter.Style,
                   timeStyle: DateFormatter.Style) -> String {
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateStyle = dateStyle
        utcDateFormatter.timeStyle = timeStyle
        utcDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return utcDateFormatter.string(from: self)
    }
    func toDateText(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
extension String {
    func toUTC_ISO8601Date() -> Date {
        // The default timeZone on ISO8601DateFormatter is UTC.
        // Set timeZone to UTTimeZone.current to get local time.
        let localISOFormatter = ISO8601DateFormatter()
        localISOFormatter.timeZone = TimeZone.current
        return localISOFormatter.date(from: self) ?? Date()
    }
    func covertToUTCText(formatter: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let convertedDate = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: convertedDate!)
    }
    func toDate(formatter: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        return dateFormatter.date(from: self) ?? Date()
    }
}
