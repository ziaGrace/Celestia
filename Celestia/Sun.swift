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
        name = "The Sun"
        information = """
Surface area:    6.09×1012 km²
Volume:    1.41×1018 km³
Mass:    1.9885×1030 kg
The Sun is the star at the center of the Solar System. It is a nearly perfect sphere of hot plasma, with internal convective motion that generates a magnetic field via a dynamo process. It is by far the most important source of energy for life on Earth. Its diameter is about 1.39 million kilometers (864,000 miles), or 109 times that of Earth, and its mass is about 330,000 times that of Earth. It accounts for about 99.86% of the total mass of the Solar System. Roughly three quarters of the Sun's mass consists of hydrogen (~73%); the rest is mostly helium (~25%), with much smaller quantities of heavier elements, including oxygen, carbon, neon, and iron.
"""
        radius = CGFloat(0.1)
        celestialDiffuse = UIImage(named: "sunmap")
        celestialEmmission = UIImage(named: "sunmap")
        
        let myLightNode = SCNNode()
        myLightNode.light = SCNLight()
        myLightNode.light?.type = .omni
        myLightNode.light?.color = UIColor.white
        myLightNode.position = SCNVector3(0, 0, 0)
        addChildNode(myLightNode)
        
       // rotationForce = rotationForeverAction
    }
}
