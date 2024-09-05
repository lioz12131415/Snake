//
//  SCSnake.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

class SCSnake {
    
    typealias Segments = [Segment]
    
    private(set) var head: Segment
    private(set) var body: Segments
    
    internal var segments: Segments {
        return [head] + body
    }
    
    internal init() {
        self.head = Segment()
        self.body = (0...8).map { _ in Segment() }
    }
    
    internal func die() {
        self.head = Segment()
        self.body = (0...8).map { _ in Segment() }
    }
    
    internal func isLocated(in x: Int, _ y: Int) -> Bool {
        return segments.first(where: {
            $0.isLocated(in: x, y)
        }) != nil
    }
    
    internal func detach() {
        for i in stride(from: segments.count - 1, through: 0, by: -1) {
            segments[i]
                .set(row: 0)
                .set(column: 0)
                .set(holder: nil)
        }
    }
    
    internal func reposition(in board: SCSnakeBoard) {
        for i in stride(from: segments.count - 1, through: 0, by: -1) {
            let row    = board.meta.y.max/2
            let column = -1-i
  
            segments[i]
                .set(row:    row)
                .set(column: column)
                .set(holder: board.rows[row]?.columns[column])
            
            segments[i].holder?.draw()
        }
    }
    
    internal func addSegment(in board: SCSnakeBoard) {
        let row    = body[body.count-1].row-1
        let column = body[body.count-1].column-1
        let segment = Segment()
        
        segment
            .set(row:    row)
            .set(column: column)
            .set(holder: board.rows[row]?.columns[column])
        
        body.insert(segment, at: body.count)
    }
}
