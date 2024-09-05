//
//  SCSnakeBoard.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import SceneKit
import Foundation

final class SCSnakeBoard: SCNNode {
    
    private(set) var rows = Rows()
    private(set) var meta = Meta()
    
    internal var randomColumn: Column? {
        return rows.flatMap { $0.columns.filter { !$0.isDrawed } }.randomElement()
    }
    
    internal func clean() {
        childNodes.forEach { $0.removeFromParentNode() }
        rows.removeAll()
    }
    
    internal func arrange(for view: SCSnakeView) {
        guard !meta.contains(view.rect.visible.width, view.rect.visible.height) else {
            return
        }
        
        meta.set(width:  view.rect.visible.width)
        meta.set(height: view.rect.visible.height)
        
        for r in 0...meta.y.max {
            var row = Row(r)
            for c in 0...meta.x.max {
                let w  = Float(meta.width)
                let h  = Float(meta.height)
                let cw = Float(meta.columnWidth)
                let ch = Float(meta.columnHeight)
                let cx = (Float(c) * cw) - (w / 2) + (cw / 2)
                let cy = (Float(r) * ch) - (h / 2) + (ch / 2)
                
                let col = Column(r,  c,
                                 cw, ch,
                                 cx, cy).draw()
                
                row.append(col)
                addChildNode(col)
            }
            rows.append(row)
        }
    }
}

