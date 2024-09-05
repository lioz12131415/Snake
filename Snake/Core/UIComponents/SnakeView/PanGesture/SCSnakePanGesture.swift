//
//  SCSnakePanGesture.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

class SCSnakePanGesture: NSObject {
    
    fileprivate var block: (UIPanGestureRecognizer.Direction) -> Void = { _ in }
    
    fileprivate lazy var gesture: UIPanGestureRecognizer = {
        return UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
    }()
    
    internal func add(to view: SCSnakeView) {
        gesture.delegate            = self
        gesture.delaysTouchesBegan = false
        gesture.delaysTouchesEnded = false
        view.addGestureRecognizer(gesture)
    }
    
    internal func onPan(_ block: @escaping(UIPanGestureRecognizer.Direction) -> Void) {
        self.block = block
    }
    
    @objc
    fileprivate func pan(_ sender: UIPanGestureRecognizer) {
        guard sender.state == .began else {
            return
        }
        block(sender.direction)
    }
}

extension SCSnakePanGesture: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}


