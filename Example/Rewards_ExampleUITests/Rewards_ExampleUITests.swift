/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import XCTest

final class Rewards_ExampleUITests: XCTestCase {

    func testAppRun() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssert(app.isEnabled)
    }
    
    func testOpenButtonSheet() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Click to open Tiki BottomSheet"].tap()
        XCTAssert(app.staticTexts["Share data. Earn cash."].exists)
    }
    func testGetEstimateNavigationButton() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Click to open Tiki BottomSheet"].tap()
        XCTAssertFalse(app.staticTexts["PROGRAM TERMS"].exists)
        XCTAssert(app.staticTexts["Share data. Earn cash."].exists)
        app.buttons["Get estimate"].tap()
        XCTAssert(app.staticTexts["PROGRAM TERMS"].exists)
    }
}
