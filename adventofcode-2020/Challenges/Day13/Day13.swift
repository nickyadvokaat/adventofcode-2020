//
//  Day13.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 13/12/2020.
//

import Foundation

class Day13 {
    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day13.txt") else {
            return
        }

        // 2 build data structure
        let input =  reader.map({ $0 })
        let depart = Int(input[0])!
        let busses = input[1].split(separator: ",").filter({ $0 != "x" }).map({ Int($0)! })

        // 3 challenge part 1
        print("Part 1: \(earliestBus(busses: busses, depart: depart))")
    }

    class func earliestBus(busses: [Int], depart: Int) -> Int {
        let waitTimes = busses.map({ bus -> Int in
            return ((depart / bus + 1) * bus) - depart
        })
        let min = waitTimes.min()!
        let busID = busses[waitTimes.firstIndex(of: min)!]
        return min * busID
    }
}
