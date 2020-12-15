//
//  Day12.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 12/12/2020.
//

import Foundation

class Day12 {
    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day12.txt") else {
            return
        }

        // 2 build data structure
        let instructions: [ShipInstruction] =  reader.map({ line in
            let res = String(line).groups(for: "^([A-Z]+)(\\d+)$")[0]
            let command = ShipCommand(rawValue: res[1][0])!
            let value = Int(res[2])!
            return ShipInstruction(command: command, value: value)
        })

        // 3 challenge part 1
        var ship = Ship()
        for instruction in instructions {
            ship.execute(instruction: instruction)
        }
        print("Part 1: \(ship.position.manhattanDistance())")

        // 4 challenge part 2
        ship = Ship()
        ship.waypoint = Coord(x: 10, y: 1)
        for instruction in instructions {
            ship.executeRelative(instruction: instruction)
        }
        print("Part 2: \(ship.position.manhattanDistance())")
    }
}
