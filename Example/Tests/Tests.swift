import XCTest
import Rewards

class Tests: XCTestCase {
    let app = XCUIApplication()

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssert(true, "Pass")
    }
    func testGetEstimate() {
        let getEstimate = NSPredicate(format: "label beginswith 'Click to open Tiki BottomSheet '")
        app.tables.buttons.element(matching: getEstimate).doubleTap()
        XCTAssert(app.staticTexts["Share data. Earn cash."].exists)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}
