//
//  tests.swift
//  tests
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import XCTest

class TestDay2IsValidPassword1: XCTestCase {

    func test1() throws {
        let p = Policy(range: 1..<3+1, character: "a", password: "abcde")
        XCTAssertTrue(p.isValid())
    }

    func test2() throws {
        let p = Policy(range: 1..<3+1, character: "b", password: "cdefg")
        XCTAssertFalse(p.isValid())
    }

    func test3() throws {
        let p = Policy(range: 2..<9+1, character: "c", password: "ccccccccc")
        XCTAssertTrue(p.isValid())
    }
}

class TestDay2IsValidPassword2: XCTestCase {

    func test1() throws {
        let p = Policy(range: 1..<3+1, character: "a", password: "abcde")
        XCTAssertTrue(p.isValid2())
    }

    func test2() throws {
        let p = Policy(range: 1..<3+1, character: "b", password: "cdefg")
        XCTAssertFalse(p.isValid2())
    }

    func test3() throws {
        let p = Policy(range: 2..<9+1, character: "c", password: "ccccccccc")
        XCTAssertFalse(p.isValid2())
    }
}
