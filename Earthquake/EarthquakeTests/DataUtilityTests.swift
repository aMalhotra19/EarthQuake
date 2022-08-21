//
//  DataUtilityTests.swift
//  EarthquakeTests
//
//  Created by Anju Malhotra on 8/21/22.
//

import XCTest
@testable import Earthquake

class DataUtilityTests: XCTestCase {
    func testConvertIntToDate() throws {
        let stringDate = DateUtility.convertIntToDate(time: 123456)
        XCTAssertNotNil(stringDate)
    }
}
