import XCTest
@testable import Website

final class WebsiteTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Website().text, "Hello, World!")
    }
}
