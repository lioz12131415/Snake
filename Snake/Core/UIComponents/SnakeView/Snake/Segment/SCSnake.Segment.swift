//
//  SCSnake.Segment.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

extension SCSnake {
    final class Segment: SCSnakeBoardDrawable {
       
        internal var row:    Int = .zero
        internal var column: Int = .zero
        
        internal var uuid:     UUID
        internal var material: SCSnakeBoardMaterial?
        
        internal var position: (x: Int, y: Int) {
            return (column, row)
        }
        
        internal weak var holder: SCSnakeBoard.Column? = nil {
            didSet  { holder?.set(drawable: self) }
            willSet { holder?.set(drawable: nil)  }
        }
        
        internal init(uuid: UUID = UUID(), image: UIImage? = .init(named: "snake_segment")) {
            self.uuid     = uuid
            self.material = image
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
}

