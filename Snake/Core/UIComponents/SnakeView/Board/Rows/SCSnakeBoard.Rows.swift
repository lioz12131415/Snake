//
//  SCSnakeBoard.Rows.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

extension SCSnakeBoard {
    struct Rows {
        
        fileprivate var elements: [Int: Row] = [:]
        
        internal var count: Int {
            return elements.count
        }
        
        internal subscript(index: Int) -> Row? {
            return elements[index]
        }
        
        internal mutating func removeAll() {
            elements.removeAll()
        }
        
        internal mutating func append(_ row: Row) {
            elements.updateValue(row, forKey: row.index)
        }
        
        internal func first(where predicate: (Row) -> Bool) -> Row? {
            elements.values.first(where: predicate)
        }

        internal func compactMap<Result>(_ transform: (Row) -> Result?) -> [Result] {
            elements.values.compactMap(transform)
        }
        
        internal func flatMap<Result>(_ transform: (Row) -> Result) -> [Result.Element] where Result : Sequence {
            elements.values.flatMap(transform)
        }
    }
}

