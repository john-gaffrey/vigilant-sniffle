import XCTest

final class ScreenshotTests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testTakeScreenshotAndSave() {
        // Wait a moment for UI to render
        sleep(1)

        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "HomeScreen"
        attachment.lifetime = .keepAlways
        add(attachment)

        // Optional: Write screenshot to file in derived data (e.g., CI logs or manual inspection)
        let data = screenshot.pngRepresentation
        let fileManager = FileManager.default
        let outputURL = fileManager.temporaryDirectory.appendingPathComponent("screenshot.png")
        try? data.write(to: outputURL)
        print("📸 Screenshot saved to: \(outputURL.path)")
    }
}
