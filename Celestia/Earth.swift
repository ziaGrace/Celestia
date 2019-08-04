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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        name = "Earth"
        celestialDiffuse = UIImage(named: "earthmap")
        celestialNormal = UIImage(named: "earthnormal")
        celestialSpecular =  UIImage(named: "earthspec")
        celestialEmmission = UIImage(named: "earthlights")
        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
        //addClouds()
        addMoon()
    }
    
    func addMoon() {
        earthMoon.name = "Moon"
        earthMoon.celestialDiffuse = UIImage(named: "moonmap")
        earthMoon.celestialNormal = UIImage(named: "moonbump")
        earthMoon.radius = self.radius * 0.5
        earthMoon.position = SCNVector3(2, 0, 0)
       
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
