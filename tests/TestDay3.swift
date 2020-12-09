//
//  TestDay3.swift
//  tests
//
//  Created by Nicky Advokaat on 03/12/2020.
//

import XCTest

class TestDay3: XCTestCase {

    func test1() throws {
        XCTAssertTrue(Day2.isValid1(lower: 1, higher: 3, character: "a", password: "abcde"))
    }

    func test2() throws {
        XCTAssertFalse(Day2.isValid1(lower: 1, higher: 3, character: "b", password: "cdefg"))
    }

    func test3() throws {
        XCTAssertTrue(Day2.isValid1(lower: 2, higher: 9, character: "c", password: "ccccccccc"))
    }
}
