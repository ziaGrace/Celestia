//
//  Celestia.swift
//  Test
//
//  Created by Zia Ratnasothy on 19/04/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Celestia: SCNNode {
    
    var anchor = Anchor()
    var radius: CGFloat = 1.0 {
        didSet {
            self.geometry = SCNSphere(radius: radius)
            refreshPlanetMaterial()
        }
    }
    var celestialMaterial = SCNMaterial() {
        didSet {
            self.geometry?.firstMaterial = celestialMaterial
        }
    }
    var celestialDiffuse:UIImage? {
        didSet {
            celestialMaterial.diffuse.contents = celestialDiffuse
            refreshPlanetMaterial()
        }
    }
    var celestialSpecular:UIImage? {
        didSet{
            celestialMaterial.specular.contents = celestialSpecular
            refreshPlanetMaterial()
        }
    }
    var celestialNormal:UIImage? {
        didSet{
            celestialMaterial.normal.contents = celestialNormal
            refreshPlanetMaterial()
        }
    }
    
    var celestialEmmission:UIImage? {
        didSet{
            celestialMaterial.emission.contents = celestialEmmission
            refreshPlanetMaterial()
        }
    }
    var rotationForce = SCNAction() {
        didSet{
            self.runAction(rotationForce)
        }
    }
    var textNode = SCNNode()
    
    func refreshPlanetMaterial() {
        self.geometry?.firstMaterial = celestialMaterial
    }
    
    func add(text:SCNText, celestia:Celestia){
        let zScale = celestia.radius / 30
        let xScale = celestia.radius / 30
        let yScale = celestia.radius / 30
        let zPosition = celestia.radius * 2
        let textMaterial = SCNMaterial()
        textMaterial.diffuse.contents = UIColor.white
        text.materials  =  [textMaterial]
        textNode.position = SCNVector3(-0.1, 0.2, zPosition)
        textNode.scale = SCNVector3(xScale, yScale, zScale)
        textNode.geometry = text
        
        celestia.addChildNode(textNode)
        
    }
    
    func removeText(){
      textNode.removeFromParentNode()
        
    }
    
 
    
    
}
