//
//  Earth.swift
//  Test
//
//  Created by Zia Ratnasothy on 27/01/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Earth: Planet {
    var earthMoon = Moon(geometry: SCNSphere())
    
   override var radius: CGFloat  {
        didSet {
            self.geometry = SCNSphere(radius: radius)
            refreshPlanetMaterial()
            earthMoon.radius = radius*0.2
            earthMoon.position  = SCNVector3( radius*2, 0, 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = "Earth"
        information = """
Surface area:
﹒510072000 km² total
﹒148940000 km² land ( 29.2%)
﹒361132000 km² water (70.8%)
Volume:   1.08321×1012 km³
Mass:   5.97237×1024 kg
Earth is the third planet from the Sun and the only astronomical object known to harbor life. According to radiometric dating and other sources of evidence, Earth formed over 4.5 billion years ago. Earth's gravity interacts with other objects in space, especially the Sun and the Moon, Earth's only natural satellite. Earth orbits around the Sun in 365.26 days, a period known as an Earth year. During this time, Earth rotates about its axis about 366.26 times.
"""
        celestialDiffuse = UIImage(named: "earthmap")
        celestialNormal = UIImage(named: "earthnormal")
        celestialSpecular =  UIImage(named: "earthspec")
        celestialEmmission = UIImage(named: "earthlights")
        eulerAngles.z = 0.4101524
        

        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
       // addClouds()
        addMoon()
    }
    
    func addMoon() {
        earthMoon.name = "Moon"
        earthMoon.celestialDiffuse = UIImage(named: "moonmap")
        earthMoon.celestialNormal = UIImage(named: "moonbump")
        earthMoon.radius = self.radius 
        earthMoon.position = SCNVector3( 0.5, 0, 0)
       
       earthMoon.anchor.rotateBy = 5
         self.addChildNode(earthMoon.anchor)
        moons.append(earthMoon)
    }

    
    func addClouds(){
    let cloudGeometry = SCNSphere(radius: radius + 0.1)
    let cloudNode = SCNNode(geometry: cloudGeometry)
    let cloudMaterial = SCNMaterial()
    cloudMaterial.diffuse.contents = UIImage(named: "earthcloudmap")
    cloudMaterial.transparencyMode = .rgbZero
    cloudMaterial.transparent.contents = UIImage(named: "earthcloudmaptrans")
    cloudNode.geometry?.firstMaterial = cloudMaterial
    addChildNode(cloudNode)
    }
    
    
}
