//
//  day1.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import Foundation

class Day1 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day1.txt") else {
            return
        }

        // 2 build data structure
        let entries =  reader.map({ Int($0)! })

        // 3 challenge part 1
        print(findTwoEntries(entries: entries) ?? "not found")

        // 4 challenge part 2
        print(findThreeEntries(report: entries) ?? "not found")
    }

    class func findTwoEntries(entries: [Int]) -> Int? {
        for i in 0..<entries.count {
            for j in 0..<entries.count {
                let first = entries[i]
                let second = entries[j]
                if first + second == 2020 {
                    return first * second
                }
            }
        }
        return nil
    }

    class func findThreeEntries(report: [Int]) -> Int? {
        for i in 0..<report.count {
            for j in 0..<report.count {
                for k in 0..<report.count {
                    let first = report[i]
                    let second = report[j]
                    let third = report[k]
                    if first + second + third == 2020 {
                        return first * second * third
                    }
                }
            }
        }
        return nil
    }
}
