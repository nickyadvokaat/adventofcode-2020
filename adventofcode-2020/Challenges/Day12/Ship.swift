//
//  Ship.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 12/12/2020.
//

import Foundation

struct Ship {
    var position: Coord = Coord()
    var direction: Direction = .east
    var waypoint: Coord = Coord()
}

extension Ship {
    mutating func execute(instruction: ShipInstruction) {
        switch instruction.command {
        case .north:
            position.y += instruction.value
        case .east:
            position.x += instruction.value
        case .south:
            position.y -= instruction.value
        case .west:
            position.x -= instruction.value
        case .left:
            direction = direction.right(times: -instruction.value / 90)
        case .right:
            direction = direction.right(times: instruction.value / 90)
        case .forward:
            switch direction {
            case .north:
                position.y += instruction.value
            case .east:
                position.x += instruction.value
            case .south:
                position.y -= instruction.value
            case .west:
                position.x -= instruction.value
            }
        }
    }

    mutating func executeRelative(instruction: ShipInstruction) {
        switch instruction.command {
        case .north:
            waypoint.y += instruction.value
        case .east:
            waypoint.x += instruction.value
        case .south:
            waypoint.y -= instruction.value
        case .west:
            waypoint.x -= instruction.value
        case .left:
            for _ in 0..<instruction.value / 90 {
                waypoint = waypoint.rotateLeftt()
            }
        case .right:
            for _ in 0..<instruction.value / 90 {
                waypoint = waypoint.rotateRight()
            }
        case .forward:
            position = position + instruction.value * waypoint
        }
    }
}
