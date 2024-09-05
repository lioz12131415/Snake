//
//  SCSnakeBoard.Row.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

extension SCSnakeBoard {
    struct Row {
                 
        private(set) var index:   Int
        private(set) var columns: Columns
        
        internal init(_ index: Int) {
            self.index   = index
            self.columns = Columns()
        }
        
        internal mutating func append(_ column: Column) {
            columns.append(column)
        }
    }
}

