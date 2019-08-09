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
        information = """
Surface area: 8.1156×109 km²
Volume:    6.833×1013 km³
Mass:    (8.6810±0.0013)×1025 kg
Uranus (from the Latin name Ūranus for the Greek god Οὐρανός) is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have bulk chemical compositions which differ from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as "ice giants" to distinguish them from the gas giants. Uranus' atmosphere is similar to Jupiter's and Saturn's in its primary composition of hydrogen and helium, but it contains more "ices" such as water, ammonia, and methane, along with traces of other hydrocarbons. It is the coldest planetary atmosphere in the Solar System, with a minimum temperature of 49 K (−224 °C; −371 °F), and has a complex, layered cloud structure with water thought to make up the lowest clouds and methane the uppermost layer of clouds. The interior of Uranus is mainly composed of ices and rock.
"""
        celestialDiffuse = UIImage(named: "uranusmap")
        
        
        
        let rotationAction = SCNAction.rotate(by: 2.0, around: SCNVector3(0, 1, 0), duration: 10)
        
        let rotationForeverAction = SCNAction.repeatForever(rotationAction)
        
        rotationForce = rotationForeverAction
        
        
        
    }
    

    
}
