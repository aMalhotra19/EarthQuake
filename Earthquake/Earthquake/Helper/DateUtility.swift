//
//  DateUtility.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation

public class DateUtility {
    /// Convert Int date into date format in dd-MM-YYYY hh:mm
    /// Returns string format of the date
    static func convertIntToDate(time: Int64) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY hh:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let now = Date()
        let resultDate = Date(timeIntervalSince1970: TimeInterval(time) / 1000)
        let beforeDate = Calendar.current.date(byAdding: .day, value: -30, to: now)!
        let range = beforeDate...now
        return range.contains(resultDate) ? dateFormatter.string(from: resultDate) : "Invalid date"
    }
    
    static func currentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: date)
    }
}
