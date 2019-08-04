//
//  Anchor.swift
//  Test
//
//  Created by Zia Ratnasothy on 02/02/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Anchor: SCNNode {
    var rotateBy = CGFloat(1.0) {
        didSet {
            self.rotationAction = SCNAction.rotate(by: rotateBy, around: SCNVector3(0, 1, 0), duration: 10)
        }
    }
    
    var rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10) {
        didSet {
            self.runAction(SCNAction.repeatForever(rotationAction))
        }
    }
    

}
