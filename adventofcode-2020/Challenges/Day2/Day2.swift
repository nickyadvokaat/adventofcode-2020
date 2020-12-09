//
//  day2.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import Foundation

public class Day2 {

    struct Policy {
        var range: Range<Int>
        var character: Character
        var password: String
    }

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day2.txt") else {
            return
        }

        // 2 build data structure
        let policies = reader.map { (line) -> Policy in
            let res = line.groups(for: "^(\\d+)-(\\d+) ([a-z]): ([a-z]+)$")[0]
            let lower = Int(res[1])!
            let higher = Int(res[2])!
            let character = Character(res[3])
            let password = res[4]
            return Policy(range: lower..<higher+1, character: character, password: password)
        }

        // 3 challenge part 1
        let validCount = policies.count(where: { p in
            let count = p.password.count(of: p.character)
            return p.range.contains(count)
        })
        print("Part 1: \(validCount)")

        // 4 challenge part 2
        let validCountNew = policies.count(where: { p in
            let pos1 = p.password[p.range.lowerBound-1] == p.character
            let pos2 = p.password[p.range.upperBound-2] == p.character
            return pos1 != pos2
        })
        print("Part 2: \(validCountNew)")
    }
}
