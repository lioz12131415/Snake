//
//  SCNPlane+Extensions.swift
//  Snake
//
//  Created by Lioz Balki on 04/09/2024.
//

import SceneKit
import Foundation

extension SCNPlane {
    internal var contents: Any? {
        get { firstMaterial?.diffuse.contents }
        set { firstMaterial?.diffuse.contents = newValue  }
    }
}
