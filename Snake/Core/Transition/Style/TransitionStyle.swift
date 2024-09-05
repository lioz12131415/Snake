//
//  TransitionStyle.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

class TransitionStyle {
    
    private(set) weak var presenting: UIViewController?
    
    private(set) lazy var dispatch: TransitionDispatch = {
        return TransitionDispatch()
    }()
    
    internal init(_ presenting: UIViewController? = nil) {
        self.presenting = presenting
    }
    
    internal func dismiss(duration: TimeInterval, completion: (() -> Void)? = nil) {
        
    }
    
    internal func present(_ viewControllerToPresent: UIViewController, duration: TimeInterval, completion: (() -> Void)? = nil) {
        
    }
}




