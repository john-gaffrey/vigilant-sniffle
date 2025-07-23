//
//  DetailViewControllerUITest.swift
//  testsDemoUITests
//
//  Created by Itsuki on 2023/10/20.
//

import XCTest

final class DetailViewControllerUITest: XCTestCase {

    var app: XCUIApplication!


    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
        app = nil
        try super.tearDownWithError()

    }
    
    

    func testDetailViewControllerInitialization() {
        
        let searchBarElement = app.otherElements["searchBar"]
        let tableView = app.tables["tableView"]
        let exists = NSPredicate(format: "exists == 1")


        searchBarElement.tap()
        searchBarElement.typeText("google")
        app.keyboards.buttons["search"].tap()
        
        // wait for data to load
        let firstTableCell = tableView.cells.firstMatch
        let expectation = expectation(for: exists, evaluatedWith: firstTableCell)
        waitForExpectations(timeout: 10, handler: nil)

        XCTAssertTrue(firstTableCell.exists, "cell 0 is not on the table")
        expectation.fulfill()
        
        let cellName = firstTableCell.staticTexts.firstMatch.label
        firstTableCell.tap()
        
        
        let staticLabel = app.staticTexts["staticLabel"]
        XCTAssertTrue(staticLabel.exists)
        XCTAssertEqual(staticLabel.label, "Static Label")
        
        let nameLabel = app.staticTexts["nameLabel"]
        XCTAssertTrue(nameLabel.exists)
        XCTAssertEqual(nameLabel.label, cellName)

    }
    
    
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
