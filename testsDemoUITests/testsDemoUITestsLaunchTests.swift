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

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)

        let data = screenshot.pngRepresentation
        let fileManager = FileManager.default
        let artifactDir = fileManager.homeDirectoryForCurrentUser.appendingPathComponent("artifacts")
        let outputURL = artifactDir.appendingPathComponent("screenshot.png")
        try? data.write(to: outputURL)
        print("📸 Screenshot saved to: \(outputURL.path)")
    }
}
