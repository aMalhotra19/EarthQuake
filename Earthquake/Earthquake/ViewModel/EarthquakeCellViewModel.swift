//
//  EarthquakeCellViewModel.swift
//  Earthquake
//
//  Created by Anju Malhotra on 8/19/22.
//

import Foundation

struct EarthquakeCellViewModel {    
    let title: String?
    let magnitude: String?
    var dateString: String {
        guard let time = time else {
            return Constants.emptyString
        }
        return DateUtility.convertIntToDate(time: time)
    }
    var time: Int64?
}
