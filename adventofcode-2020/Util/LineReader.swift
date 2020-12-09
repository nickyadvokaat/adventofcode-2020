//
//  LineReader.swift
//  adventofcode-2020
//
//  Created by Nicky Advokaat on 02/12/2020.
//

import Foundation

// Reads text file line by line
public class LineReader {
    public let path: String

    fileprivate let file: UnsafeMutablePointer<FILE>!

    init?(path: String) {
        self.path = path

        file = fopen(path, "r")

        guard file != nil else { return nil }
    }

    public var nextLine: String? {
        var line: UnsafeMutablePointer<CChar>?
        var linecap: Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!).removingOccurrences(of: "\n") : nil
    }

    deinit {
        fclose(file)
    }
}

extension LineReader: Sequence {
    public func makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}
