//
//  SCSnakeBoard.Columns.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

extension SCSnakeBoard {
    struct Columns {
        
        fileprivate var elements: [Int: Column] = [:]
        
        internal var count: Int {
            return elements.count
        }
        
        internal subscript(index: Int) -> Column? {
            return elements[index]
        }
        
        internal func randomElement() -> Column? {
            elements.values.randomElement()
        }
        
        internal mutating func append(_ column: Column) {
            elements.updateValue(column, forKey: column.index)
        }
        
        internal func filter(_ isIncluded: (Column) -> Bool) -> [Column] {
            elements.values.filter(isIncluded)
        }
        
        internal func first(where predicate: (Column) -> Bool) -> Column? {
            elements.values.first(where: predicate)
        }
    }
}

