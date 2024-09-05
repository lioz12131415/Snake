//
//  TransitionDispatch.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

final class TransitionDispatch {
    
    internal var main: DispatchQueue {
        return DispatchQueue.main
    }
    
    internal func async(_ block: @escaping() -> Void) {
        guard !Thread.isMainThread else {
            return block()
        }
        main.async {
            block()
        }
    }
}
