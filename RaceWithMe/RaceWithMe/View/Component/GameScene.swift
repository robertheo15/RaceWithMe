//
//  GameScene.swift
//  RaceWithMe
//
//  Created by robert theo on 29/04/24.
//

import SwiftUI
import SceneKit

struct GameScene: View {

    @Binding var carGame: Car
    @State private var scene: SCNScene = SCNScene(named: "art.scnassets/scene_garage.scn")!
    @State private var garageViewNode: SCNNode?
    @State private var lastWidthRatio: Float = 0
    @State private var lastHeightRatio: Float = 0
    @Binding var selectedColor: CGColor
    @Binding var selectedCarType: CarType?

    var body: some View {
        SceneView(scene: scene)
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { gesture in
                    updateRotation(translation: gesture.translation)
                }
                .onEnded { gesture in
                    updateLastRatios(translation: gesture.predictedEndLocation)
                }
            )
            .onChange(of: selectedCarType) { oldCarType, newCarType in
                            if let newCarType = newCarType {
                                carGame.type = newCarType // Update carGame type based on selection
                            }
                        }
            .onAppear {
                loadScene()
            }
            .ignoresSafeArea(.all)
    }

    func loadScene() {
        // Add camera and lights (similar to original code)
        // You can add these here or within the SceneKit scene file.

        // Retrieve camera node
//            guard let cameraNode = scene.rootNode.childNode(withName: "camera", recursively: true) else {
//                fatalError("Camera node not found")
//            }

            // Adjust camera properties
//            cameraNode.position = SCNVector3(x: 0, y: 5, z: 10) // Example position
//            cameraNode.eulerAngles = SCNVector3(x: -Float.pi / 6, y: 0, z: 0) // Example rotation (pitch)
        
        // Retrieve car and garage nodes
        let sedan = scene.rootNode.childNode(withName: CarType.sedan.rawValue, recursively: true)!
        let cooper = scene.rootNode.childNode(withName: CarType.cooper.rawValue, recursively: true)!
        
        if carGame.carNumber == "" {
            sedan.opacity = 0
            cooper.opacity = 0
        } else {
            switch carGame.type {
                case .sedan:
                    sedan.opacity = 1
                    cooper.opacity = 0
                case .cooper:
                    sedan.opacity = 0
                    cooper.opacity = 1
                case .supercar:
                    // Handle supercar opacity or any other cases if needed
                    sedan.opacity = 0
                    cooper.opacity = 0
                }
        }

        
//        let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!
        garageViewNode = scene.rootNode.childNode(withName: "garageView", recursively: true)
//        car.scale = SCNVector3(0.3, 0.3, 0.3)
//        garageViewNode?.scale = SCNVector3(0.6, 0.6, 0.6)

        // Animate car and ship
//        let moveForwardActionCar = SCNAction.moveBy(x: 0, y: -2, z: 0, duration: 2.0)
//        let moveForwardActionShip = SCNAction.moveBy(x: -2, y: 0, z: 0, duration: 2.0)
//        car.runAction(SCNAction.repeatForever(moveForwardActionCar))
//        ship.runAction(SCNAction.repeatForever(moveForwardActionShip))
    }

    func updateRotation(translation: CGSize) {
        let widthRatio = Float(translation.width) / Float(UIScreen.main.bounds.width) + lastWidthRatio
        let heightRatio = Float(translation.height) / Float(UIScreen.main.bounds.height) + lastHeightRatio
        garageViewNode?.eulerAngles.y = -2 * Float.pi * widthRatio
    }

    func updateLastRatios(translation: CGPoint) {
        lastWidthRatio = Float(translation.x.truncatingRemainder(dividingBy: CGFloat(Float(UIScreen.main.bounds.width))))
        lastHeightRatio = Float(translation.y.truncatingRemainder(dividingBy: CGFloat(Float(UIScreen.main.bounds.height))))
    }

//    func updateCarColor() {
//            let colorMaterial = SCNMaterial()
//            colorMaterial.diffuse.contents = UIColor(cgColor: selectedColor)
//
//            sedanNode?.geometry?.materials = [colorMaterial]
//            cooperNode?.geometry?.materials = [colorMaterial]
//        }
}
//
//struct GameScene_Previews: PreviewProvider {
//    static var previews: some View {
//        GameScene()
//    }
//}
//
//#Preview {
//    GameScene()
//}

