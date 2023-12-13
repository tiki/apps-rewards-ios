/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import XCTest

final class Rewards_ExampleUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testOpenApp() {
        let app = XCUIApplication()
        app.launch()
        app.buttons["Click to open Tiki BottomSheet"].tap()
        XCTAssertFalse(app.staticTexts["PROGRAM TERMS"].exists)
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
