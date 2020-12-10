//
//  TestDay9.swift
//  tests
//
//  Created by Nicky Advokaat on 09/12/2020.
//

import XCTest

class TestDay9: XCTestCase {

    let entries = [35, 20, 15, 25, 47, 40, 62, 55, 65, 95, 102, 117, 150, 182, 127, 219, 299, 277, 309, 576]

    func testFindTarget() throws {
        let target = Day9.findTarget(entries: entries, preamble: 5)
        XCTAssertEqual(target, 127)
    }

    func testFindWeakness() throws {
        let weakness = Day9.findWeakness(entries: entries, target: 127)
        XCTAssertEqual(weakness, 62)
    }
}
