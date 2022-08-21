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
        dateFormatter.dateFormat = "dd-MM-YYYY hh:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(time) / 1000))
    }
}
