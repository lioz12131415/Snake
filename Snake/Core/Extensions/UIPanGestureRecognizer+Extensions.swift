//
//  UIPanGestureRecognizer+Extensions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

extension UIPanGestureRecognizer {
    internal var direction: Direction {
        let velocity = velocity(in: view)
    
        if abs(velocity.x) > abs(velocity.y) {
            if velocity.x > 0 { return .right } else { return .left }
        }
        else {
            if velocity.y > 0 { return .down } else { return .up }
        }
    }
}

extension UIPanGestureRecognizer {
    internal enum Direction {
        case up
        case down
        case left
        case right
    }
}
