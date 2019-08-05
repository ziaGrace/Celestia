//
//  SaturnRings.swift
//  Celestia
//
//  Created by Zia Ratnasothy on 05/08/2019.
//  Copyright © 2019 Ratnasothy. All rights reserved.
//

//import UIKit
//import SceneKit
//
////class SaturnRings: SCNNode {
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    init(geometry: SCNGeometry?){
//        super.init()
//        self.geometry = geometry
//        name = "SaturnRings"
//        //celestialDiffuse = UIImage(named: "SaturnsRings")
//
//    }
//
//   // var radius: CGFloat = 1.0 {
//        didSet {
//            self.geometry = SCNTube(innerRadius: 0.85,  outerRadius: 1, height: 0.05)
//            refreshPlanetMaterial()
//        }
//    }
//    var celestialMaterial = SCNMaterial() {
//        didSet {
//            self.geometry?.firstMaterial = celestialMaterial
//        }
//    }
//    var celestialDiffuse:UIImage? {
//        didSet {
//            celestialMaterial.diffuse.contents = celestialDiffuse
//            refreshPlanetMaterial()
//        }
//    }
//
//    func refreshPlanetMaterial() {
//        self.geometry?.firstMaterial = celestialMaterial
//    }
//}
