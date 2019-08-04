//
//  Moon.swift
//  Test
//
//  Created by Zia Ratnasothy on 02/02/2019.
//  Copyright © 2019 Zia Ratnasothy. All rights reserved.
//

import UIKit
import SceneKit

class Moon: Celestia {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    init(geometry: SCNGeometry?){
        super.init()
        self.geometry = geometry
        anchor.addChildNode(self)
    }
}
