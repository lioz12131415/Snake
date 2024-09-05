//
//  SCSnakeBoard.Meta.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

extension SCSnakeBoard {
    struct Meta {
        
        private(set) var width:  CGFloat = .zero
        private(set) var height: CGFloat = .zero
        
        internal var y: (min: Int, max: Int) {
            return (0, Int(Float(height) / columnHeight)-1)
        }
        
        internal var x: (min: Int, max: Int) {
            return (0, Int(Float(width) / columnWidth)-1)
        }
        
        internal var columnWidth: Float {
            return Float(width) / Float(Int(width))
        }
        
        internal var columnHeight: Float {
            return Float(height) / Float(Int(height))
        }
        
        internal mutating func set(width: CGFloat) {
            self.width = width
        }
        
        internal mutating func set(height: CGFloat) {
            self.height = height
        }
        
        internal func contains(_ w: CGFloat, _ h: CGFloat) -> Bool {
            return width == w && height == h && w != .nan && h != .nan
        }
    }
}


