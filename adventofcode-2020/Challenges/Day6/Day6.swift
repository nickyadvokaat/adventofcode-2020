//
//  Day5.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 06/12/2020.
//

import Foundation

class Day6 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day6.txt") else {
            return
        }

        // 2 part 1+2
        var anyYes = 0
        var allYes = 0
        var yesCount: [Character: Int] = [:]
        var numberOfQuestions = 0
        for line in reader {
            if line == "" {
                anyYes += yesCount.keys.count
                allYes += yesCount.values.count(where: {$0 == numberOfQuestions})

                yesCount = [:]
                numberOfQuestions = 0
            } else {
                for char in line {
                    yesCount.updateValue(yesCount[char, default: 0] + 1, forKey: char)
                }
                numberOfQuestions += 1
            }
        }
        print("Result part 1: \(anyYes)")
        print("Result part 2: \(allYes)")
    }
}
