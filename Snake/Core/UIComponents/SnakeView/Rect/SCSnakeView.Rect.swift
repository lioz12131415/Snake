//
//  SCSnakeView.Rect.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import Foundation

extension SCSnakeView {
    struct Rect {
        
        fileprivate weak var target: SCSnakeView?   = nil
        fileprivate weak var camera: SCSnakeCamera? = nil
        
        internal var ratio: CGFloat {
            return width/height
        }
        
        internal var width: CGFloat {
            return target?.bounds.width ?? 1
        }
        
        internal var height: CGFloat {
            return target?.bounds.height ?? 1
        }
        
        internal var fieldOfView: CGFloat {
            return camera?.camera?.fieldOfView ?? 60
        }
        
        internal var x: (max: Float, min: Float) {
            let v = visible
            let x = v.width / 2
            return (Float(x), Float(-x))
        }
        
        internal var y: (max: Float, min: Float) {
            let v = visible
            let x = v.height / 2
            return (Float(x), Float(-x))
        }
        
        internal var visible: (width: CGFloat, height: CGFloat) {
            let distance = CGFloat(camera?.position.z ?? .zero)
            let radians  = fieldOfView * (.pi / 180)
            
            let height = 2 * tan(radians / 2) * distance
            let width  = height * ratio
            return (width, height)
        }
        
        internal init(_ target: SCSnakeView, _ camera: SCSnakeCamera) {
            self.target = target
            self.camera = camera
        }
    }
}

