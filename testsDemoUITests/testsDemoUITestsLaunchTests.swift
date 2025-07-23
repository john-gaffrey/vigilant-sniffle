//
//  testsDemoUITestsLaunchTests.swift
//  testsDemoUITests
//
//  Created by Itsuki on 2023/10/17.
//

import XCTest

final class testsDemoUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        sleep(1)
        let searchBarElement = app.otherElements["searchBar"]
        searchBarElement.tap()
        searchBarElement.typeText("google")
        sleep(1)

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
