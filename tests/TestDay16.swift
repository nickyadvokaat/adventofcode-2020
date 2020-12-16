//
//  TestDay16.swift
//  tests
//
//  Created by Nicky Advokaat on 15/12/2020.
//

import XCTest

class TestDay16: XCTestCase {

    func testTicketsErrorRate() throws {
        let ticketRules = [
            TicketRule(name: "class", allowedRanges: [1...3, 5...7]),
            TicketRule(name: "row", allowedRanges: [6...11, 33...44]),
            TicketRule(name: "seat", allowedRanges: [13...40, 45...50])
        ]
        let tickets = [[7, 3, 47],
                       [40, 4, 50],
                       [55, 2, 20],
                       [38, 6, 12]]

        let rate = Day16.ticketsErrorRate(tickets: tickets, ticketRules: ticketRules)
        XCTAssertEqual(71, rate)
    }

    func testYourTicketMult() throws {
        let ticketRules = [
            TicketRule(name: "departureA", allowedRanges: [0...1, 4...19]),
            TicketRule(name: "departureB", allowedRanges: [0...5, 8...19]),
            TicketRule(name: "departureC", allowedRanges: [0...13, 16...19])
        ]
        let yourTicket = [11, 12, 13]
        let tickets = [[3, 9, 18],
                       [15, 1, 5],
                       [5, 14, 9]]

        let result = Day16.yourTicketMult(tickets: tickets, yourTicket: yourTicket, rules: ticketRules)
        XCTAssertEqual(11 * 12 * 13, result)
    }
}
