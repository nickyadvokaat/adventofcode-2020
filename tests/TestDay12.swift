//
//  TestDay12.swift
//  tests
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import XCTest

class TestDay12: XCTestCase {

    let instructions: [ShipInstruction] = [
        ShipInstruction(command: .forward, value: 10),
        ShipInstruction(command: .north, value: 3),
        ShipInstruction(command: .forward, value: 7),
        ShipInstruction(command: .right, value: 90),
        ShipInstruction(command: .forward, value: 11)
    ]

    func testExecute() throws {
        var ship = Ship()
        for instruction in instructions {
            ship.execute(instruction: instruction)
        }
        XCTAssertEqual(25, ship.position.manhattanDistance())
    }

    func testExecuteRelative() throws {
        var ship = Ship()
        ship.waypoint = Coord(x: 10, y: 1)
        for instruction in instructions {
            ship.executeRelative(instruction: instruction)
        }
        XCTAssertEqual(286, ship.position.manhattanDistance())
    }
}
