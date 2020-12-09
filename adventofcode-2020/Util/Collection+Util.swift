//
//  Collection+Util.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 08/12/2020.
//

import Foundation

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}
