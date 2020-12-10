//
//  Day10.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 09/12/2020.
//

import Foundation

class Day10 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day10.txt") else {
            return
        }

        // 2 build data structure
        let adapters =  reader.map({ Int($0)! })

        // 3 challenge part 1
        let solution1 = joltDiff(adapters: adapters)
        print("Part 1: \(solution1)")

        // 4 challenge part 2
        let solution2 = waysToArrange(adapters: adapters)
        print("Part 2: \(solution2)")
    }

    class func joltDiff(adapters: [Int]) -> Int {
        var adapters = adapters.sorted()
        adapters.append(adapters.max()! + 3)
        var nr1 = 0
        var nr3 = 0
        var prev = 0
        for i in 0..<adapters.count {
            let diff = adapters[i] - prev
            if diff == 1 {
                nr1 += 1
            }
            if diff == 3 {
                nr3 += 1
            }
            prev = adapters[i]
        }
        return nr1 * nr3
    }

    class func waysToArrange(adapters: [Int]) -> Int {
        var adapters = adapters.sorted()
        adapters.append(adapters.max()! + 3)

        var diffs: [Int] = []
        for i in 0..<adapters.count {
            diffs.append(adapters[i] - (i > 0 ? adapters[i-1] : 0))
        }

        var result = 1
        var c = 0
        for i in 0..<diffs.count {
            if diffs[i] == 1 {
                c += 1
            } else if c > 0 {
                var times = 1
                if c == 2 {
                    times = 2
                }
                if c == 3 {
                    times = 4
                }
                if c == 4 {
                    times = 7
                }
                result *= times
                c = 0
            }
        }
        return result
    }

}
