//
//  SCSnakeBoard.Column.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import SceneKit
import Foundation

extension SCSnakeBoard {
    final class Column: SCNNode {
        
        private(set) var row:   Int = .zero
        private(set) var index: Int = .zero
        
        private(set) weak var drawable: SCSnakeBoardDrawable? {
            willSet { clear() }
        }
        
        internal var isDrawed: Bool {
            return drawable != nil
        }
        
        internal var width: CGFloat {
            return plane?.width ?? .zero
        }
        
        internal var height: CGFloat {
            return plane?.height ?? .zero
        }

        internal convenience init(_ r: Int, _ i: Int, _ w: Float, _ h: Float, _ x: Float, _ y: Float) {
            self.init()
            self.row      = r
            self.index    = i
            self.position = .init(x: x, y: y, z: 0)
            self.geometry = SCNPlane(width: CGFloat(w), height: CGFloat(h))
        }
        
        internal func clear() {
            self.plane?.contents = UIColor.clear
        }
        
        @discardableResult func draw() -> Self {
            self.plane?.contents = drawable?.material ?? UIColor.clear
            return self
        }
        
        @discardableResult func set(drawable: SCSnakeBoardDrawable?) -> Self {
            self.drawable = drawable
            return self
        }
    }
}

