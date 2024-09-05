//
//  NSObject+Extentions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

extension NSObject {
    var pointer: String {
        return "\(Unmanaged.passUnretained(self).toOpaque())"
    }
}

