//
//  Mars.swift
//  Test
//
//  Created by Zia Ratnasothy on 03/02/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Mars: Planet {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = """
          Mars
          Surface area 144798500 km2
          Volume    1.6318×1011 km3
          Mass    6.4171×1023 kg
          """
        celestialDiffuse = UIImage(named: "marsmap")
        celestialNormal = UIImage(named: "marsnormal")
        
        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
        
    }
    
    
}
