//
//  SCSnakeBoardDrawable.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

protocol SCSnakeBoardDrawable: AnyObject {
    var position: (x: Int, y: Int) { get }
    
    var holder:   SCSnakeBoard.Column?  { get set }
    var material: SCSnakeBoardMaterial? { get set }
}

extension SCSnakeBoardDrawable {
    internal func isLocated(in x: Int, _ y: Int) -> Bool {
        return position.x == x && position.y == y
    }
}
