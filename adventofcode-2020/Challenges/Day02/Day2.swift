//
//  day2.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import Foundation

struct Policy {
    var range: Range<Int>
    var character: Character
    var password: String
}

extension Policy {
    func isValid() -> Bool {
        return range.contains(password.count(of: character))
    }

    func isValid2() -> Bool {
        let pos1 = password[range.lowerBound-1] == character
        let pos2 = password[range.upperBound-2] == character
        return pos1 != pos2
    }
}

public class Day2 {

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
        let validCount = policies.count(where: { $0.isValid() })
        print("Part 1: \(validCount)")

        // 4 challenge part 2
        let validCountNew = policies.count(where: { $0.isValid2() })
        print("Part 2: \(validCountNew)")
    }
}
