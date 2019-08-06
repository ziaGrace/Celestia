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
    
    var information = ""
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
}
