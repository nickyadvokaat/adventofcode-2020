//
//  Day6.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 06/12/2020.
//

import Foundation

class Day7 {

    typealias RuleSet = [String: [Requirement]]

    struct Requirement {
        var name = ""
        var number = 0
    }

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day7.txt") else {
            return
        }

        // 2 build data structure
        var ruleSet: RuleSet = [:]
        for line in reader {
            let ruleStrings = line.split(separator: "-")
            let index = String(ruleStrings[0])
            if String(ruleStrings[1]) == "noother" {
                ruleSet[index] = []
            } else {
                var requirements: [Requirement] = []
                for i in 1..<ruleStrings.count {
                    let res = String(ruleStrings[i]).groups(for: "^(\\d+)([a-z]+)$")
                    let number = Int(res[0][1])!
                    let value = res[0][2]
                    requirements.append(Requirement(name: value, number: number))
                }
                ruleSet[index] = requirements
            }
        }

        // 3 challenge part 1
        let numberBagsContainingShinyGoldBag = numberOfBagsCanContain(dict: ruleSet, contained: "shinygold") - 1
        print("Result part 1: \(numberBagsContainingShinyGoldBag)")

        // 4 challenge part 2
        let numberBagsInsideShinyGoldBag = bagsRecursive(dict: ruleSet, key: "shinygold") - 1
        print("Result part 2: \(numberBagsInsideShinyGoldBag)")
    }

    class func numberOfBagsCanContain(dict: RuleSet, contained: String) -> Int {
        var keys: Set<String> = [contained]
        var oldCount = 0
        while keys.count > oldCount {
            let newKeys = dict.filter {
                for key in keys {
                    if $0.value.contains(where: {$0.name == key}) {
                        return true
                    }
                }
                return false
            }
            oldCount = keys.count
            for key in newKeys.keys {
                keys.insert(key)
            }
        }
        return keys.count
    }

    class func bagsRecursive(dict: RuleSet, key: String) -> Int {
        return dict.first(where: {$0.key == key})!.value.reduce(1, {x, y in
            x + y.number * bagsRecursive(dict: dict, key: y.name)
        })
    }
}
