//
//  Sun.swift
//  Test
//
//  Created by Zia Ratnasothy on 27/01/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Sun: Planet {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = "Sun"
        radius = CGFloat(5.0)
        celestialDiffuse = UIImage(named: "sunmap")
        celestialEmmission = UIImage(named: "sunmap")
        
        
        
       // rotationForce = rotationForeverAction
    }
}
