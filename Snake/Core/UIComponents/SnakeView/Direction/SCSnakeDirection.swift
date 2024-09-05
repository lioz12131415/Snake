//
//  SCSnakeDirection.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

struct SCSnakeDirection {
    
    internal var x: Int
    internal var y: Int
    
    internal var initial: (x: Int, y: Int)
    
    internal init(x: Int = 1, y: Int = 0) {
        self.x       = x
        self.y       = y
        self.initial = (x, y)
    }
    
    internal mutating func redirecte() {
        self.set(x: initial.x, y: initial.y)
    }
    
    internal mutating func set(x: Int) {
        self.x = x
    }
    
    internal mutating func set(y: Int) {
        self.y = y
    }
    
    internal mutating func set(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    internal func canChange(to direction: UIPanGestureRecognizer.Direction, state: SCSnakeState) -> Bool {
        guard state == .running else {
            return false
        }
        switch direction {
            case .up    where y != -1 && y != +1: return true
            case .down  where y != +1 && y != -1: return true
            case .left  where x != +1 && x != -1: return true
            case .right where x != -1 && x != +1: return true
        default:
            return false
        }
    }
}

