//
//  UIImageView+Extensions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

extension UIImageView {
    convenience init(image: UIImage?, frame: CGRect) {
        self.init(image: image)
        self.frame = frame
    }
}

