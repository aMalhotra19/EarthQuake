//
//  UIActuvityIndicatorView+HelperTests.swift
//  EarthquakeTests
//
//  Created by Anju Malhotra on 8/21/22.
//

import XCTest
@testable import Earthquake

class UIActivityIndicatorView_HelperTests: XCTestCase {
    var activity: UIActivityIndicatorView?
    var view: UIView?
    
    override func setUp() {
        super.setUp()
        activity = UIActivityIndicatorView()
        view = UIView()
    }
    
    override func tearDown() {
        super.tearDown()
        activity = nil
        view = nil
    }

    func testActivity() {
        activity?.showLoadingIndicator(with: view ?? UIView())
        XCTAssertEqual(activity?.color, UIColor.brown)
        XCTAssertEqual(activity?.center, view?.center)
        XCTAssertEqual(view?.subviews.first, activity)
    }
    
    func testHideActivity() {
        activity?.showLoadingIndicator(with: view ?? UIView())
        activity?.hideLoadingIndicator()
        XCTAssertNil(view?.subviews.first)
    }

}
