//
//  Day15.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import Foundation

class Day15 {

    class func run() {
        let input = [1, 0, 16, 5, 17, 4]
        print("Part 1: \(spokenNumber(input: input, turns: 2020))")
        print("Part 2: \(spokenNumber(input: input, turns: 30000000))")
    }

    class func spokenNumber(input: [Int], turns: Int) -> Int {
        var lastIndex: [Int: Int] = [:]
        for i in 0..<input.count - 1 {
            lastIndex[input[i]] = i + 1
        }
        var lastSpoken = input.last!
        var turn = input.count + 1
        while turn < turns + 1 {
            var newlast = 0
            if let lastIndex = lastIndex[lastSpoken] {
                newlast = turn - 1 - lastIndex
            }
            lastIndex[lastSpoken] = turn - 1
            lastSpoken = newlast
            turn += 1
        }
        return lastSpoken
    }
}
