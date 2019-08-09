//
//  Jupiter.swift
//  Test
//
//  Created by Zia Ratnasothy on 03/02/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Jupiter: Planet {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = "Jupiter"
        information = """
Surface area: 6.1419×1010 km²
Volume: 1.4313×1015 km³
Mass: 1.8982×1027 kg
Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter has been known to astronomers since antiquity. It is named after the Roman god Jupiter. When viewed from Earth, Jupiter can be bright enough for its reflected light to cast shadows, and is on average the third-brightest natural object in the night sky after the Moon and Venus.
"""
        celestialDiffuse = UIImage(named: "jupitermap")
       
        
        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
        
    }

    
}
