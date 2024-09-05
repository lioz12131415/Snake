//
//  Transition+Associated.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

fileprivate var initialKey: UInt8 = 0

extension UIViewController {
    internal var transition: Transition {
        return withUnsafePointer(to: &initialKey) { [weak self] in
            guard let self else {
                return Transition()
            }
            if let objc = objc_getAssociatedObject(self, $0) {
                return objc as! Transition
            }
            else {
                objc_setAssociatedObject(self, $0, Transition(self), .OBJC_ASSOCIATION_RETAIN)
            }
            return objc_getAssociatedObject(self, $0) as! Transition
        }
    }
}
