//
//  Transition.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

final class Transition {
    
    fileprivate weak var presenting: UIViewController? = nil
    
    fileprivate lazy var pixelated: TransitionPixelatedStyle = {
        return TransitionPixelatedStyle(presenting)
    }()
    
    init(_ presenting: UIViewController? = nil) {
        self.presenting = presenting
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, type: TransitionType, duration: TimeInterval, completion: (() -> Void)? = nil) {
        switch type {
            case .pixelated:
                pixelated.present(viewControllerToPresent, duration: duration, completion: completion)
        }
    }
}

