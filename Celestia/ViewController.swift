//
//  ViewController.swift
//  Celestia
//
//  Created by Zia Ratnasothy on 04/08/2019.
//  Copyright © 2019 Ratnasothy. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    let myScene = SCNScene()
    var sun = Sun(geometry: SCNSphere())
    var earth = Earth(geometry: SCNSphere())
    var venus = Venus(geometry: SCNSphere())
    var mercury = Mercury(geometry: SCNSphere())
    var mars = Mars(geometry: SCNSphere())
    var jupiter = Jupiter(geometry: SCNSphere())
    var saturn = Saturn(geometry: SCNSphere())
    var uranus = Uranus(geometry: SCNSphere())
    var neptune = Neptune(geometry: SCNSphere())
    var lastPlanetTapped = Planet()
    var saturnRings =  SCNScene(named: "art.scnassets/saturnRings.scn")!.rootNode.childNode(withName: "saturnRings", recursively: true)!
    //SaturnRings(geometry: SCNTube(innerRadius: 3,  outerRadius: 4, height: 0.05))
    
    let myCameraNode = SCNNode()
    let myLightNode = SCNNode()
    var myCloudNode = SCNNode()
    let earthAnchor = Anchor()
    let mercuryAnchor = Anchor()
    let venusAnchor = Anchor()
    let marsAnchor = Anchor()
    let jupiterAnchor = Anchor()
    let saturnAnchor = Anchor()
    let uranusAnchor = Anchor()
    let neptuneAnchor = Anchor()
    let sunAnchor = Anchor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        

      //  let saturnRings = xcodeScene?.rootNode.childNode(withName: "saturnRings", recursively: true)
        
     //   print("xcodeScene =", xcodeScene)
        
        sunAnchor.position = SCNVector3(0, 0, -75)
        addCamera()
        myScene.rootNode.addChildNode(sunAnchor)
        addSun()
        addLight()
        addEarth()
        addMercury()
        addVenus()
        addMars()
        addJupiter()
        addSaturn()
        addUranus()
        addNeptune()
        
        sceneView.allowsCameraControl = true
        //sceneView.defaultCameraController.interactionMode = .orbitTurntable
        //sceneView.defaultCameraController.automaticTarget = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = myScene
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action:
            #selector(tap(_:)))
        sceneView.addGestureRecognizer(tapGesture)
        
    }
    func addSun(){
        sunAnchor.addChildNode(sun)
    }
    
    func addMercury() {
        sun.addChildNode(mercuryAnchor)
        mercury.radius = 0.45
        mercury.position = SCNVector3(5.5, 0, 0)
        mercuryAnchor.rotateBy = 5.0
        mercuryAnchor.addChildNode(mercury)
        
    }
    
    func addVenus() {
        
        sun.addChildNode(venusAnchor)
        venus.radius = 0.65
        venus.position = SCNVector3(10, 0, 0)
        venusAnchor.rotateBy = 4.0
        venusAnchor.addChildNode(venus)
        
    }
    
    func addEarth() {
        sun.addChildNode(earthAnchor)
        earth.radius = 1.0
        earth.position = SCNVector3(15, 0, 0)
        earthAnchor.rotateBy = 3.0
        earthAnchor.addChildNode(earth)
    }
    
    func addMars() {
        sun.addChildNode(marsAnchor)
        mars.radius = 1.5
        mars.position = SCNVector3(20, 0, 0)
        marsAnchor.rotateBy = 2.0
        marsAnchor.addChildNode(mars)
    }
    
    
    func addJupiter() {
        sun.addChildNode(jupiterAnchor)
        jupiter.radius = 2.5
        jupiter.position = SCNVector3(25, 0, 0)
        jupiterAnchor.rotateBy = 1.5
        jupiterAnchor.addChildNode(jupiter)
    }
    
    
    func addSaturn() {
        sun.addChildNode(saturnAnchor)
        saturn.radius = 2
        saturn.position = SCNVector3(30, 0, 0)
        saturnAnchor.rotateBy = 1
        saturnAnchor.addChildNode(saturn)
        
      saturnRings.position = SCNVector3(0, 0, 0)
      saturn.addChildNode(saturnRings)
    }
    func addUranus(){
        
        sun.addChildNode(uranusAnchor)
        uranus.radius = 1.5
        uranus.position = SCNVector3(35, 0, 0)
        uranusAnchor.rotateBy = 0.5
        uranusAnchor.addChildNode(uranus)
        
    }
    
    func addNeptune(){
        
        sun.addChildNode(neptuneAnchor)
        neptune.radius = 1
        neptune.position = SCNVector3(40, 0, 0)
        neptuneAnchor.rotateBy = 0.25
        neptuneAnchor.addChildNode(neptune)
    }
    
    func addCamera() {
        myCameraNode.camera = SCNCamera()
        myCameraNode.position = SCNVector3(0, 0, 75)
        myScene.rootNode.addChildNode(myCameraNode)
        
    }
    
    
    func addLight() {
        
        myLightNode.light = SCNLight()
        myLightNode.light?.type = .omni
        myLightNode.light?.color = UIColor.white
        myLightNode.position = SCNVector3(-30, 0, 15)
        myScene.rootNode.addChildNode(myLightNode)
        
    }
    
   
    
    
    
    @objc func tap(_ gestureRecognize: UIGestureRecognizer) {
        // check what nodes are tapped
        let p = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        // check that we tapped on at least one object
        if hitResults.count > 0 {
            // retrieved the first tapped object
            let object = hitResults[0].node
            
            if object is Planet {
                let planet = object as! Planet
                planet.showInformation()
                lastPlanetTapped = planet
                if myCameraNode.parent == object {
                } else {
                    SCNTransaction.begin()
                    SCNTransaction.animationDuration = 2.0
                    planet.addChildNode(myCameraNode)
                    let zPosition = planet.radius * 6
                    myCameraNode.position = SCNVector3(0, 0, zPosition)
                    sceneView.pointOfView = myCameraNode
                    SCNTransaction.commit()
                    
                    
                }
            }
        } else {
            lastPlanetTapped.hideInformation()
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 2.0
            sun.addChildNode(myCameraNode)
            let zPosition = sun.radius * 6
            myCameraNode.position = SCNVector3(0, 0, zPosition)
            sceneView.pointOfView = myCameraNode
            SCNTransaction.commit()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        // Do something with the new transform
        print("did update frame")
        print(frame.camera.transform)
        sunAnchor.transform = SCNMatrix4(frame.camera.transform)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
