//
//  Coord.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 12/12/2020.
//

import Foundation

struct Coord {
    var x: Int = 0
    var y: Int = 0
}

extension Coord {
    func manhattanDistance() -> Int {
        return abs(x) + abs(y)
    }
}

extension Coord: ExpressibleByArrayLiteral {
    init(arrayLiteral: Int...) {
        assert(arrayLiteral.count == 2, "Must initialize vector with 2 values.")
        self.x = arrayLiteral[0]
        self.y = arrayLiteral[1]
    }
}

extension Coord: CustomStringConvertible {
    var description: String {
        return "(\(x), \(y))"
    }
}

extension Coord {
    static func + (left: Coord, right: Coord) -> Coord {
        return [
          left.x + right.x,
          left.y + right.y
        ]
    }

    static func - (left: Coord, right: Coord) -> Coord {
      return left + -right
    }

    static prefix func - (vector: Coord) -> Coord {
        return [-vector.x, -vector.y]
    }

    static func * (left: Int, right: Coord) -> Coord {
      return [
        right.x * left,
        right.y * left
      ]
    }

    static func * (left: Coord, right: Int) -> Coord {
      return right * left
    }
}

extension Coord: Equatable {
  static func == (left: Coord, right: Coord) -> Bool {
    return left.x == right.x && left.y == right.y
  }
}
