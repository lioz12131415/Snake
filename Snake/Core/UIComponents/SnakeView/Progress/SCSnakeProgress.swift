//
//  SCSnakeProgress.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

final class SCSnakeProgress {
    
    typealias Time      = CGFloat
    typealias TickBlock = (Timer?) -> Void
    
    fileprivate var timer: Timer?    = nil
    fileprivate var block: TickBlock = { _ in }
    
    @discardableResult func invalidate() -> Self {
        self.killTimer()
        return self
    }
    
    @discardableResult func schedule(time: TimeInterval) -> Self {
        self.setTimer(time)
        return self
    }
    
    @discardableResult func onTick(_ block: @escaping(Timer?) -> Void) -> Self {
        self.block = block
        return self
    }
}

extension SCSnakeProgress {
    fileprivate func killTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    fileprivate func setTimer(_ time: TimeInterval) {
        self.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true) { [weak self] timer in
            self?.block(timer)
        }
    }
}


