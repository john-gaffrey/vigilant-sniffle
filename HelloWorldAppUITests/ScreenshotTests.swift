import XCTest

final class ScreenshotTests: XCTestCase {

    func testTakeScreenshotAndSave() {
        let app = XCUIApplication()
        app.launch()

        XCTAssert(app.staticTexts["Hello world"].exists)

        // Wait a moment for UI to render
        sleep(1)

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)

        // // Optional: Write screenshot to file in derived data (e.g., CI logs or manual inspection)
        // let data = screenshot.pngRepresentation
        // let fileManager = FileManager.default
        // let outputURL = fileManager.temporaryDirectory.appendingPathComponent("screenshot.png")
        // try? data.write(to: outputURL)
        // print("📸 Screenshot saved to: \(outputURL.path)")
    }
}
