//
//  UIImage+Extensions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import UIKit
import Foundation

extension UIImage {
    internal static var playFill: UIImage? {
        return UIImage(systemName: "play.fill")
    }
}

extension UIImage {
    internal static var pauseFill: UIImage? {
        return UIImage(systemName: "pause.fill")
    }
}

extension UIImage {
    internal func cropping(to rect: CGRect) -> UIImage? {
        let scaledRect = CGRect(x:      rect.origin.x    * scale,
                                y:      rect.origin.y    * scale,
                                width:  rect.size.width  * scale,
                                height: rect.size.height * scale)
        
        guard let cgImage = self.cgImage?.cropping(to: scaledRect) else {
            return nil
        }
        return UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
    }
}

