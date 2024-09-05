//
//  SCSnakeCamera.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import SceneKit
import Foundation

class SCSnakeCamera: SCNNode {
    
    convenience init(x: Float = 0, y: Float = 0, z: Float = 0) {
        self.init()
        self.recalibration(x: x, y: y, z: z)
    }
    
    internal func recalibration(x: Float = 0, y: Float = 0, z: Float) {
        let camera = SCNCamera()
        let vector = SCNVector3(x: x, y: y, z: z)
        
        self.camera   = camera
        self.position = vector
        self.look(at: SCNVector3(0, 0, 0))
    }
}

