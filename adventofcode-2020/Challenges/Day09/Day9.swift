//
//  Day9.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 08/12/2020.
//

import Foundation

class Day9 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day9.txt") else {
            return
        }

        // 2 build data structure
        let entries =  reader.map({ Int($0)! })
        let preamble = 25

        // 3 challenge part 1
        let target = findTarget(entries: entries, preamble: preamble)!
        print("Part 1: \(target)")

        // 4 challenge part 2
        let weakness = findWeakness(entries: entries, target: target)!
        print("Part 2: \(weakness)")
    }

    class func findTarget(entries: [Int], preamble: Int) -> Int? {
        for i in preamble..<entries.count {
            let value = entries[i]
            if !isSum(entries: Array(entries[i-preamble..<i]), sum: value) {
                return value
            }
        }
        return nil
    }

    class func isSum(entries: [Int], sum: Int) -> Bool {
        for i in 0..<entries.count-1 {
            for j in i+1..<entries.count {
                if entries[i] + entries[j] == sum {
                    return true
                }
            }
        }
        return false
    }

    class func findWeakness(entries: [Int], target: Int) -> Int? {
        for i in 0..<entries.count-1 {
            for j in i+1..<entries.count {
                let arr = entries[i..<j+1]
                let sum = arr.reduce(0, +)
                if sum > target {
                    break
                }
                if sum == target {
                    return arr.min()! + arr.max()!
                }
            }
        }
        return nil
    }
}
