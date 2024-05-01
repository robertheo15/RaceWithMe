//
//  ContentView.swift
//  displayscene
//
//  Created by Jennifer Luvindi on 01/05/24.
//


struct CustomRaceSceneView: UIViewRepresentable {
    @Binding var raceScene: SCNScene?
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = raceScene
        view.backgroundColor = .clear
        
        
        return view
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
}

import SwiftUI
import SceneKit

struct TrialView: View {
    
    @State var raceScene: SCNScene? = .init(named: "art.scnassets/race.scn")
    
    var body: some View {
        VStack {
            CustomRaceSceneView(raceScene: $raceScene)
                .frame(height: 450)
        }
        .padding()
    }
    
}

#Preview {
    TrialView()
}
