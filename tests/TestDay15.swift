//
//  TestDay15.swift
//  tests
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import XCTest

class TestDay15: XCTestCase {

    func testMemoryGame1() throws {
        let x = Day15.spokenNumber(input: [1, 2, 3], turns: 2020)
        XCTAssertEqual(x, 27)
    }

    func testMemoryGame2() throws {
        let x = Day15.spokenNumber(input: [3, 1, 2], turns: 2020)
        XCTAssertEqual(x, 1836)
    }

    func testMemoryGame3() throws {
        let x = Day15.spokenNumber(input: [0, 3, 6], turns: 30000000)
        XCTAssertEqual(x, 175594)
    }
}
