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

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, UIGestureRecognizerDelegate {
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var planetTextView: UITextView!
 
    @IBOutlet weak var planetTitleLabel: UILabel!
    var object: SCNNode?
    var currentAngleY: Float = 0.0
    
    let planetProportions = [
        "Mercury" : 7,
        "Venus" : 5.5,
        "Earth" : 5,
        "Mars" : 6.5,
        "Jupiter" : 1.5,
        "Saturn" : 3.5,
        "Uranus" : 8,
        "Neptune" : 3.5,
    ]

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
    
    //let myCameraNode = SCNNode()
    //let myLightNode = SCNNode()
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
    

    //let myView = UIView(frame: rect)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        object = sun
        planetTextView.layer.cornerRadius = 3;
        planetTextView.layer.masksToBounds = true;
        planetTitleLabel.layer.cornerRadius = 3;
        planetTitleLabel.layer.masksToBounds = true;
        
       // let string = "Testing Attributed Strings"
       // let attributedString = NSMutableAttributedString(string: string)
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
        

      //  let saturnRings = xcodeScene?.rootNode.childNode(withName: "saturnRings", recursively: true)
        
     //   print("xcodeScene =", xcodeScene)
        
        sunAnchor.position = SCNVector3(0, 0, -1)
        //addCamera()
        myScene.rootNode.addChildNode(sunAnchor)
        addSun()
      //  addLight()
        addEarth()
        addMercury()
        addVenus()
        addMars()
        addJupiter()
        addSaturn()
        addUranus()
        addNeptune()
        
        //sceneView.allowsCameraControl = true
        //sceneView.defaultCameraController.interactionMode = .orbitTurntable
        ////sceneView.defaultCameraController.automaticTarget = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.scene = myScene
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        panGesture.delegate = self
        
        
        sceneView.addGestureRecognizer(tapGesture)
        sceneView.addGestureRecognizer(pinchGesture)
        sceneView.addGestureRecognizer(panGesture)
        
        
        
    }
    func addSun(){
        sunAnchor.addChildNode(sun)
        
    }
    
    func addMercury() {
        sun.addChildNode(mercuryAnchor)
        mercury.radius = sun.radius / CGFloat(planetProportions["Mercury"]!)
        mercury.position = SCNVector3(sun.radius*2, 0, 0)
        mercuryAnchor.rotateBy = 5.0
        mercuryAnchor.addChildNode(mercury)
        
    }
    
    func addVenus() {
        
        sun.addChildNode(venusAnchor)
        venus.radius = sun.radius / CGFloat(planetProportions["Venus"]!)
        venus.position = SCNVector3(sun.radius*3, 0, 0)
        venusAnchor.rotateBy = 4.0
        venusAnchor.addChildNode(venus)
        
    }
    
    func addEarth() {
        sun.addChildNode(earthAnchor)
        earth.radius = sun.radius / CGFloat(planetProportions["Earth"]!)
        earth.position = SCNVector3(sun.radius*4, 0, 0)
        earthAnchor.rotateBy = 3.0
        earthAnchor.addChildNode(earth)
    }
    
    func addMars() {
        sun.addChildNode(marsAnchor)
        mars.radius = sun.radius / CGFloat(planetProportions["Mars"]!)
        mars.position = SCNVector3(sun.radius*5, 0, 0)
        marsAnchor.rotateBy = 2.0
        marsAnchor.addChildNode(mars)
    }
    
    
    func addJupiter() {
        sun.addChildNode(jupiterAnchor)
        jupiter.radius = sun.radius / CGFloat(planetProportions["Jupiter"]!)
        jupiter.position = SCNVector3(sun.radius*6, 0, 0)
        jupiterAnchor.rotateBy = 1.5
        jupiterAnchor.addChildNode(jupiter)
    }
    
    
    func addSaturn() {
        sun.addChildNode(saturnAnchor)
        saturn.radius = sun.radius / CGFloat(planetProportions["Saturn"]!)
        saturn.position = SCNVector3(sun.radius*7, 0, 0)
        saturnAnchor.rotateBy = 1
        saturnAnchor.addChildNode(saturn)
       saturnRings.position = SCNVector3(0, 0, 0)
       saturn.addChildNode(saturnRings)
    }
    
    func addUranus(){
        sun.addChildNode(uranusAnchor)
        uranus.radius = sun.radius / CGFloat(planetProportions["Uranus"]!)
        uranus.position = SCNVector3(sun.radius*8, 0, 0)
        uranusAnchor.rotateBy = 0.5
        uranusAnchor.addChildNode(uranus)
        
    }
    
    func addNeptune(){
        sun.addChildNode(neptuneAnchor)
        neptune.radius = sun.radius / CGFloat(planetProportions["Neptune"]!)
        neptune.position = SCNVector3(sun.radius*9, 0, 0)
        neptuneAnchor.rotateBy = 0.25
        neptuneAnchor.addChildNode(neptune)
    }
    
    @objc
    func didPan(_ gesture: UIPanGestureRecognizer) {
        print("didPan")
        guard let _ = object else { return }
        let translation = gesture.translation(in: gesture.view)
        var newAngleY = (Float)(translation.x)*(Float)(Double.pi)/180.0
        
        newAngleY += currentAngleY
        object?.eulerAngles.y = newAngleY
        
        if gesture.state == .ended{
            currentAngleY = newAngleY
        }
    }
    
    @objc
    func didPinch(_ gesture: UIPinchGestureRecognizer) {
        print("did pinch")
        guard let _ = object else { return }
        var originalScale = object?.scale
        
        switch gesture.state {
        case .began:
            originalScale = object?.scale
            gesture.scale = CGFloat((object?.scale.x)!)
        case .changed:
            guard var newScale = originalScale else { return }
            if gesture.scale < 0.5{ newScale = SCNVector3(x: 0.5, y: 0.5, z: 0.5) }else if gesture.scale > 2{
                newScale = SCNVector3(2, 2, 2)
            }else{
                newScale = SCNVector3(gesture.scale, gesture.scale, gesture.scale)
            }
            object?.scale = newScale
        case .ended:
            guard var newScale = originalScale else { return }
            if gesture.scale < 0.5{ newScale = SCNVector3(x: 0.5, y: 0.5, z: 0.5) }else if gesture.scale > 2{
                newScale = SCNVector3(2, 2, 2)
            }else{
                newScale = SCNVector3(gesture.scale, gesture.scale, gesture.scale)
            }
            object?.scale = newScale
            gesture.scale = CGFloat((object?.scale.x)!)
        default:
            gesture.scale = 1.0
            originalScale = nil
        }
    }

    @objc func didTap(_ gestureRecognize: UIGestureRecognizer) {
        // check what nodes are tapped
        let p = gestureRecognize.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        // check that we tapped on at least one object
        if hitResults.count > 0 {
            // retrieved the first tapped object
            let object = hitResults[0].node
            
            if object is Planet {
                let planet = object as! Planet
                lastPlanetTapped = planet
                planetTextView.text = planet.information
                planetTitleLabel.text = planet.name
            
            }
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
//Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        // Do something with the new transform
//        print("did update frame")
//        print(frame.camera.transform)
     //   sunAnchor.transform = SCNMatrix4(frame.camera.transform)
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
