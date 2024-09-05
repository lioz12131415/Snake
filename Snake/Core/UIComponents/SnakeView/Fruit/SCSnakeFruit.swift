//
//  SCSnakeFruit.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

final class SCSnakeFruit: SCSnakeBoardDrawable {
    
    internal var row:    Int = .zero
    internal var column: Int = .zero
    
    internal var uuid:     UUID
    internal var material: SCSnakeBoardMaterial?
    
    internal var isDrawed: Bool {
        return holder?.isDrawed ?? false
    }
    
    internal var position: (x: Int, y: Int) {
        return (column, row)
    }
    
    internal weak var holder: SCSnakeBoard.Column? = nil {
        didSet  { holder?.set(drawable: self) }
        willSet { holder?.set(drawable: nil)  }
    }
    
    internal init(uuid: UUID = UUID(), image: UIImage? = .init(named: "snake_fruit")) {
        self.uuid     = uuid
        self.material = image
    }
    
    internal func detach() {
        self.set(row:    0)
        self.set(column: 0)
        self.set(holder: nil)
    }
    
    internal func reposition(in board: SCSnakeBoard) {
        guard let column = board.randomColumn else {
            return
        }
        self.set(row:    column.row)
        self.set(column: column.index)
        self.set(holder: column).holder?.draw()
    }
    
    @discardableResult func set(row: Int) -> Self {
        self.row = row
        return self
    }
    
    @discardableResult func set(column: Int) -> Self {
        self.column = column
        return self
    }
    
    @discardableResult func set(holder: SCSnakeBoard.Column?) -> Self {
        self.holder = holder
        return self
    }
}


