//
//  ShipInstruction.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 12/12/2020.
//

import Foundation

enum ShipCommand: Character { case north = "N", south = "S", east = "E", west = "W", left = "L", right = "R", forward = "F" }

struct ShipInstruction {
    var command: ShipCommand
    var value: Int
}
