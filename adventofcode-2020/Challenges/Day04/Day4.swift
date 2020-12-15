//
//  Day4.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 03/12/2020.
//

import Foundation

enum Key: String {
    case byr, iyr, eyr, hgt, hcl, ecl, pid, cid
}

let requiredFields: Set<Key> = [.byr, .iyr, .eyr, .hgt, .hcl, .ecl, .pid]

struct Property {
    var key: Key
    var value: String
}

typealias Passport = [Property]

extension Passport {

    func hasRequiredField() -> Bool {
        return requiredFields.isSubset(of: self.map({ $0.key }))
    }

    private func hasValidValues() -> Bool {
        return self.allSatisfy({ $0.isValid() })
    }

    func isValid() -> Bool {
        return hasRequiredField() && hasValidValues()
    }
}

extension Property {
    func isValid() -> Bool {
        switch key {
        case .byr:
            let year = Int(value)!
            return 1920 <= year && year <= 2002
        case .iyr:
            let year = Int(value)!
            return 2010 <= year && year <= 2020
        case .eyr:
            let year = Int(value)!
            return 2020 <= year && year <= 2030
        case .hgt:
            let res = value.groups(for: "(\\d+)(cm|in)")
            if res.count == 0 {
                return false
            }
            let height = Int(res[0][1])!
            let unit = res[0][2]
            return unit == "cm" ? 150 <= height && height <= 193 : 59 <= height && height <= 76
        case .hcl:
            return value.groups(for: "^#[abcdef0-9]{6}$").count > 0
        case .ecl:
            let eyeColors: Set = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
            return eyeColors.contains(value)
        case .pid:
            return value.groups(for: "^\\d{9}$").count > 0
        default:
            return true
        }
    }
}

class Day4 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day4.txt") else {
            return
        }

        // 2 build data structure
        var passports: [Passport] = []
        var passport: Passport = []
        for line in reader {
            if line == "" {
                passports.append(passport)
                passport = []
            } else {
                let x = line.split(separator: " ").map({ (q) -> Property in
                    let res = String(q).groups(for: "^([a-z]+):(#?\\w+)$")
                    return Property(key: Key(rawValue: res[0][1])!, value: res[0][2])
                })
                passport.append(contentsOf: x)
            }
        }

        // 3 challenge part 1
        let validAllRequired = passports.count(where: { $0.hasRequiredField() })
        print("Part 1: \(validAllRequired)")

        // 4 challenge part 2
        let valid = passports.count(where: { $0.isValid() })
        print("Part 2: \(valid)")
    }
}
