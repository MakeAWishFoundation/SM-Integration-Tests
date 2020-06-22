//
//  PrototypingTests.swift
//  PrototypingTests
//
//  Created by Andrzej Michnia on 25/05/2019.
//  Copyright © 2019 MakeAWishFoundation. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import Prototyping

class UnitTests: XCTestCase {

    func testExample() {
        let mock = NumberGeneratorMock()
        Given(mock, .next(willReturn: 1,2,3))
        XCTAssertEqual(mock.next(), 1)
        XCTAssertEqual(mock.next(), 2)
        XCTAssertEqual(mock.next(), 3)
    }

}
