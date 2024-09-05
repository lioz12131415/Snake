//
//  SCSnakeView.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import SceneKit
import Foundation

class SCSnakeView: SCNView {
    
    fileprivate lazy var snake      = SCSnake()
    fileprivate lazy var board      = SCSnakeBoard()
    fileprivate lazy var fruit      = SCSnakeFruit()
    fileprivate lazy var camera     = SCSnakeCamera()
    fileprivate lazy var metaData   = SCSnakeMetaData()
    fileprivate lazy var progress   = SCSnakeProgress()
    fileprivate lazy var direction  = SCSnakeDirection()
    fileprivate lazy var panGesture = SCSnakePanGesture()

    private(set) lazy var rect: Rect = {
        return Rect(self, camera)
    }()
    
    internal var data: SCSnakeData {
        return metaData
    }
    
    internal var observe: SCSnakeMetaObservable {
        return metaData
    }
    
    internal override var bounds: CGRect {
        didSet { bounds(bounds, oldValue: oldValue) }
    }

    override init(frame: CGRect, options: [String : Any]? = nil) {
        super.init(frame: frame, options: options)
        self.commit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commit()
    }
    
    internal func stop() {
        guard metaData.state == .running else {
            return
        }
        self.pause()
    }
    
    internal func start() {
        switch metaData.state {
            case .paused:    resume()
            case .initial:   initial()
            case .gameOver:  restart()
            case .snakeBite: recover()
        default:
            break
        }
    }
    
    internal func start(after deadline: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now()+deadline) { [weak self] in
            self?.start()
        }
    }
    
    fileprivate func commit() {
        self.scene = SCNScene()
        self.panGesture.add(to: self)
        self.bounds(bounds, oldValue: .zero)
        self.scene?.rootNode.addChildNode(board)
        self.scene?.rootNode.addChildNode(camera)
        self.progress.onTick  { [weak self] t in self?.update() }
        self.panGesture.onPan { [weak self] d in self?.direction(d) }
    }
    
    fileprivate func run() {
        self.metaData.state.change(to: .running)
        self.progress.schedule(time: 0.1)
    }
    
    fileprivate func pause() {
        self.metaData.state.change(to: .paused)
        self.progress.invalidate()
    }
    
    fileprivate func initial() {
        self.reposition(snake: true, fruit: true)
        self.run()
    }
    
    fileprivate func resume() {
        self.reposition(snake: false, fruit: !fruit.isDrawed)
        self.run()
    }
    
    fileprivate func recover() {
        self.metaData.set(life: metaData.life-1)
        self.direction.redirecte()
        self.fruit.detach()
        self.snake.detach()
        self.initial()
    }
    
    fileprivate func restart() {
        self.metaData.set(score: 0)
        self.metaData.set(life: 3)
        self.direction.redirecte()
        self.fruit.detach()
        self.snake.detach()
        self.snake.die()
        self.initial()
    }

    fileprivate func invalidate(with state: SCSnakeState) {
        self.metaData.state.change(to: state)
        self.progress.invalidate()
    }
    
    fileprivate func reposition(snake: Bool = false, fruit: Bool = false) {
        if snake { self.snake.reposition(in: board) }
        if fruit { self.fruit.reposition(in: board) }
    }
    
    fileprivate func bounds(_ newValue: CGRect, oldValue: CGRect) {
        guard newValue != oldValue else {
            return
        }
        self.camera.recalibration(z: 60 * (Float(newValue.height) / 665))
        self.board.clean()
        
        self.progress.invalidate()
        self.direction.redirecte()
        self.fruit.detach()
        self.snake.detach()
        
        self.board.arrange(for: self)
        self.reposition(snake: true, fruit: metaData.state == .running)
        
        if metaData.state == .running {
            self.run()
        }
    }
 
    fileprivate func update() {
        let x = board.meta.x
        let y = board.meta.y
        
        var vector: (x: Int, y: Int) = (
            x: snake.head.position.x + 1 * direction.x,
            y: snake.head.position.y + 1 * direction.y
        )
        
        if snake.isLocated(in: vector.x, vector.y) {
            return invalidate(with: metaData.life > 0 ? .snakeBite : .gameOver)
        }
        
        if vector.y > y.max { vector.y = y.min }
        if vector.x > x.max { vector.x = x.min }
        if vector.y < y.min { vector.y = y.max }
        if vector.x < x.min { vector.x = x.max }
        
        if fruit.isLocated(in: vector.x, vector.y) {
            metaData.score += 1
            fruit.reposition(in: board)
            snake.addSegment(in: board)
        }
        
        for i in 0..<snake.segments.count {
            let position = snake.segments[i].position
            
            snake.segments[i]
                .set(row:    vector.y)
                .set(column: vector.x)
                .set(holder: board.rows[vector.y]?.columns[vector.x])
            
            snake.segments[i].holder?.draw()
            vector = position
        }
    }
    
    fileprivate func direction(_ newValue: UIPanGestureRecognizer.Direction) {
        guard direction.canChange(to: newValue, state: metaData.state) else {
            return
        }
        switch newValue {
            case .up:    direction.set(x: 00, y: +1)
            case .down:  direction.set(x: 00, y: -1)
            case .left:  direction.set(x: -1, y: 00)
            case .right: direction.set(x: +1, y: 00)
        }
    }
}

