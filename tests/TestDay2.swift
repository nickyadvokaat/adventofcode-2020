//
//  tests.swift
//  tests
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import XCTest

class TestDay2IsValidPassword1: XCTestCase {

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

class TestDay2IsValidPassword2: XCTestCase {

    func test1() throws {
        XCTAssertTrue(Day2.isValid2(lower: 1, higher: 3, character: "a", password: "abcde"))
    }

    func test2() throws {
        XCTAssertFalse(Day2.isValid2(lower: 1, higher: 3, character: "b", password: "cdefg"))
    }

    func test3() throws {
        XCTAssertFalse(Day2.isValid2(lower: 2, higher: 9, character: "c", password: "ccccccccc"))
    }
}
