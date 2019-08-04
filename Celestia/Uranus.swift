//
//  Uranus.swift
//  Test
//
//  Created by Zia Ratnasothy on 03/02/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Uranus: Planet {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = "Uranus"
        celestialDiffuse = UIImage(named: "uranusmap")
        
        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
        
        
    }
    

    
}
