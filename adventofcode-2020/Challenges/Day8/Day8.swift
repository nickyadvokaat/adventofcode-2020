//
//  Day8.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 08/12/2020.
//

import Foundation

class Day8 {
    class func run() {

        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day8.txt") else {
            return
        }

        var instructions: [Instruction] = []

        for line in reader {
            let res = line.groups(for: "^([a-z]+) ([+,-]\\d+)$")
            let instruction = Instruction(operation: Operation(rawValue: res[0][1])!, argument: Int(res[0][2])!)
            instructions.append(instruction)
        }

//        var ip = 0
//        var acc = 0
//        while true {
//            let instruction = instructions[ip]
//
//            if instruction.hasRun {
//                print(acc)
//                return
//            }
//
//            instructions[ip].hasRun = true
//            switch instruction.operation {
//            case .acc:
//                acc += instruction.argument
//                ip += 1
//            case .jmp:
//                ip += instruction.argument
//            case .nop:
//                ip += 1
//            }
//        }

        for i in 0..<instructions.count {
            if instructions[i].operation == .jmp {
                instructions[i].operation = .nop
                if terminates(program: instructions) {
                    return
                }
                instructions[i].operation = .jmp
            }
            if instructions[i].operation == .nop {
                instructions[i].operation = .jmp
                if terminates(program: instructions) {
                    return
                }
                instructions[i].operation = .nop
            }
        }

        //print(terminates(program: instructions) ? "Yes" : "No")

    }

    class func terminates(program: [Instruction]) -> Bool {
        var ip = 0
        var acc = 0
        var count = 0
        while true {
            if ip == program.count {
                print(acc)
                return true
            }
            if count == 1000 {
                return false
            }
            let instruction = program[ip]
            switch instruction.operation {
            case .acc:
                acc += instruction.argument
                ip += 1
            case .jmp:
                ip += instruction.argument
            case .nop:
                ip += 1
            }

            count += 1
        }
    }
}

struct Instruction {
    var operation: Operation
    var argument: Int
    var hasRun = false
}

enum Operation: String {
    case acc, jmp, nop
}
