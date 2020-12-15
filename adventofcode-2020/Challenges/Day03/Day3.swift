//
//  Day3.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 03/12/2020.
//

import Foundation

class Day3 {
    class func run () {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day3.txt") else {
            return
        }

        // 2 build data structure
        let totLines = 323
        let totCols = 31
        var map = Array(repeating: Array(repeating: false, count: totLines), count: totCols)
        var row = 0
        for line in reader {
            for col in 0..<line.count {
                map[col][row] = line[col] == "#"
            }
            row += 1
        }

        // 3 challenge part 1
        let trees = numberOfTrees(map: map, stepX: 3, stepY: 1)
        print("Part 1: \(trees)")

        // 4 challenge part 2
        let slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
        let multipliedTrees = slopes.reduce(1, { x, y in
            x * numberOfTrees(map: map, stepX: y[0], stepY: y[1])
        })
        print("Part 2: \(multipliedTrees)")
    }

    class func numberOfTrees(map: [[Bool]], stepX: Int, stepY: Int) -> Int {
        var numberOfTrees = 0
        var posX = 0
        var posY = 0
        let numberOfColumns = map.count
        let numberOfRows = map[0].count

        while posY < numberOfRows {
            if map[posX % numberOfColumns][posY] {
                numberOfTrees += 1
            }
            posX += stepX
            posY += stepY
        }

        return numberOfTrees
    }

    class func printMap(map: [[Bool]]) {
        for y in 0..<map[0].count {
            for x in 0..<map.count {
                print(map[x][y] ? "#" : " ", terminator: "")
            }
            print("")
        }
    }
}
