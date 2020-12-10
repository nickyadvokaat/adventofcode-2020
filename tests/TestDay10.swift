//
//  TestDay10.swift
//  tests
//
//  Created by Nicky Advokaat on 10/12/2020.
//

import XCTest

class TestDay10: XCTestCase {

    let adapters = [28, 33, 18, 42, 31, 14, 46, 20, 48, 47, 24, 23, 49, 45, 19, 38, 39, 11, 1, 32, 25, 35, 8, 17, 7, 9, 4, 2, 34, 10, 3]

    let adaptersSmall = [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]

    func testJoltDiff() throws {
        let target = Day10.joltDiff(adapters: adapters)
        XCTAssertEqual(target, 22 * 10)
    }

    func testWaysToArrangeSmall() throws {
        let target = Day10.waysToArrange(adapters: adaptersSmall)
        XCTAssertEqual(target, 8)
    }

    func testWaysToArrange() throws {
        let target = Day10.waysToArrange(adapters: adapters)
        XCTAssertEqual(target, 19208)
    }
}
