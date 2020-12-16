//
//  Day16.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import Foundation

struct TicketRule {
    var name: String
    var allowedRanges: [ClosedRange<Int>]

    func allowed(value: Int) -> Bool {
        return allowedRanges.contains(where: { $0.contains(value) })
    }
}

typealias Ticket = [Int]

typealias TicketRules = [TicketRule]

extension TicketRules {
    func isValid(ticket: Ticket) -> Bool {
        return !ticket.contains(where: { value in
            !self.contains(where: { x in
                x.allowed(value: value)
            })
        })
    }

    func matchesExactlyOne(tickets: [Ticket], allowedIndices: [Int]) -> (TicketRule, Int)? {
        for rule in self {
            var count = 0
            var index = 0
            for i in allowedIndices {
                let values = tickets.map({ $0[i] })
                if !values.contains(where: { !rule.allowed(value: $0)}) {
                    index = i
                    count += 1
                }
            }
            if count == 1 {
                return (rule, index)
            }
        }
        return nil
    }
}

class Day16 {

    class func run() {
        // 1 read data
        guard
            let reader = LineReader(path: "/Users/nickyadvokaat/projects/adventofcode-2020/adventofcode-2020/Data/Day16.txt") else {
            return
        }

        // 2 build data structure
        var ticketRules: TicketRules = []
        var tickets: [Ticket] = []
        var yourTicket: Ticket = []
        var part = 0
        for line in reader {
            if line == "" {
                part += 1
            } else if part == 0 {
                let res = line.groups(for: "^(.+): (\\d+)-(\\d+) or (\\d+)-(\\d+)$")[0]
                let name = res[1]
                let allowedRanges = [Int(res[2])!...Int(res[3])!, Int(res[4])!...Int(res[5])!]
                ticketRules.append(TicketRule(name: name, allowedRanges: allowedRanges))
            } else if part == 1 && !line.contains("y") {
                yourTicket = line.split(separator: ",").map({ Int($0)! })
            } else if part == 2 && !line.contains("y") {
                let ticket = line.split(separator: ",").map({ Int($0)! })
                tickets.append(ticket)
            }
        }

        // Challenge part 1
        let rate = ticketsErrorRate(tickets: tickets, ticketRules: ticketRules)
        print("Part 1: \(rate)")

        // Challenge part 2
        let result = yourTicketMult(tickets: tickets, yourTicket: yourTicket, rules: ticketRules)
        print("Part 2: \(result)")
    }

    class func ticketsErrorRate(tickets: [Ticket], ticketRules: TicketRules) -> Int {
        return tickets.reduce(0, { x, y in
            x + y.reduce(0, { x, y in
                if ticketRules.contains(where: { $0.allowed(value: y )}) {
                    return x
                }
                return x + y
            })
        })
    }

    class func yourTicketMult(tickets: [Ticket], yourTicket: Ticket, rules: TicketRules) -> Int {
        var ticketRules = rules
        let validTickets = tickets.filter({ ticketRules.isValid(ticket: $0 )})
        var allowed = Array(0..<validTickets[0].count)
        var mul = 1
        while ticketRules.count > 0 {
            let (exactlyOne, index) = ticketRules.matchesExactlyOne(tickets: validTickets, allowedIndices: allowed)!
            if exactlyOne.name.range(of: "departure") != nil {
                mul *= yourTicket[index]
            }
            allowed = allowed.filter({ $0 != index })
            ticketRules = ticketRules.filter({ $0.name != exactlyOne.name })
        }
        return mul
    }
}
