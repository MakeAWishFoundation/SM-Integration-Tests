//
//  PrototypingUITests.swift
//  PrototypingUITests
//
//  Created by Andrzej Michnia on 25/05/2019.
//  Copyright © 2019 MakeAWishFoundation. All rights reserved.
//

import XCTest

class PrototypingUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        app.launch()
        print()
    }

    func testExample() {
        let app = XCUIApplication()

        XCTAssertTrue(app.staticTexts["0"].exists)

        for number in [1,2,5,3,43,8,6,4,3,5,6,0] {
            app.tap()
            XCTAssertTrue(app.staticTexts["\(number)"].exists)
        }
    }
}
