//
//  SCNNode+Extensions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import SceneKit
import Foundation

extension SCNNode {
    internal var plane: SCNPlane? {
        return geometry as? SCNPlane
    }
}

