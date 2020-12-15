//
//  TestDay13.swift
//  tests
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import XCTest

class TestDay13: XCTestCase {

    func testEarliestBus1() throws {
        XCTAssertEqual(295, Day13.earliestBus(busses: [7, 13, 59, 31, 19], depart: 939))
    }
}
