//
//  SCSnakeState.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

internal enum SCSnakeState {
    case paused
    case running
    case initial
    case gameOver
    case snakeBite
    
    mutating func change(to newValue: SCSnakeState) {
        self = newValue
    }
}

