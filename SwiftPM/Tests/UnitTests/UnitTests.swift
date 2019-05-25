import XCTest
import SwiftyMocky
@testable import Unit

final class UnitTests: XCTestCase {

    func testExample() {
        let mock = NumberGeneratorMock()
        Given(mock, .next(willReturn: 1,2,3))
        XCTAssertEqual(mock.next(), 1)
        XCTAssertEqual(mock.next(), 2)
        XCTAssertEqual(mock.next(), 3)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
