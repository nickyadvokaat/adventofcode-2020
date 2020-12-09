//
//  TestDay1.swift
//  tests
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import XCTest

class TestDay1FindTwoEntries: XCTestCase {

    func test1() throws {
        let list = [1721, 979, 366, 299, 675, 1456]
        assert(Day1.findTwoEntries(entries: list) == 514579)
    }
}

class TestDay1FindThreeEntries: XCTestCase {

    func test1() throws {
        let list = [1721, 979, 366, 299, 675, 1456]
        assert(Day1.findThreeEntries(entries: list) == 241861950)
    }
}
