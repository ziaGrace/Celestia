//
//  Planet.swift
//  Test
//
//  Created by Zia Ratnasothy on 20/01/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Planet: Celestia {
    
    var moons : [Moon] = []

     func showInformation(){
        print("Celestia: showInformationCalled")
       
    }

    
    func hideInformation(){
        print("Celestia: hideInformationCalled")
      
    }
    
   
    
    
}
