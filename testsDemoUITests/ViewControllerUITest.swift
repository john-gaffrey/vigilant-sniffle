//
//  ViewControllerUITest.swift
//  testsDemoUITests
//
//  Created by Itsuki on 2023/10/20.
//

import XCTest
@testable import testsDemo


final class ViewControllerUITest: XCTestCase {
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

    func testViewControllerInitialization() {
        let searchBarElement = app.otherElements["searchBar"]
        XCTAssertTrue(searchBarElement.exists)
        
        let tableView = app.tables["tableView"]
        XCTAssertTrue(tableView.exists)

    }
    
    
    func testUISearchBarTyping() {

        let searchBarElement = app.otherElements["searchBar"]
        XCTAssertTrue(searchBarElement.exists)
        
        searchBarElement.tap()
        XCTAssertTrue(app.keyboards.firstMatch.exists)
        
        searchBarElement.typeText("test")
        app.keyboards.keys["T"].tap()

    }
    
    func testTableViewScroll() {
        
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

        let cellCount = tableView.cells.count
        let lastTableCell = tableView.cells.allElementsBoundByIndex[cellCount-1]
            
        // scroll to the end
        while !lastTableCell.isHittable {
            tableView.swipeUp()
        }
        XCTAssertTrue(lastTableCell.isHittable, "Not able to scroll to the end of the Table")
        
        // scroll back to the top
        while !firstTableCell.isHittable {
            tableView.swipeDown()
        }
        XCTAssertTrue(firstTableCell.isHittable, "Not able to scroll to the beginning of the Table")

    }
    
    func testNavigation() {
        
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
        
        firstTableCell.tap()
        
        let backButton = app.navigationBars["navBar"].buttons["Back"]
        XCTAssertTrue(backButton.exists)
        backButton.tap()
        
    }
    

    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
