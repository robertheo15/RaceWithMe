//
//  confettiView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import SwiftUI
import SceneKit

struct Movement {
    var x: CGFloat = 0
    var y: CGFloat = 0
    var z: CGFloat = 1
    var opacity: Double = 0
}

struct RaceViewVersion2: View {
    @State private var confettiMovements: [Movement] = []
    @State private var isAnimating = false
    @Environment(\.presentationMode) var presentationMode
    @State var raceScene: SCNScene? = .init(named: "art.scnassets/race.scn")
    @Binding var carGame: Car

    var body: some View {
        VStack {
            ZStack {
                CustomRaceSceneView(raceScene: $raceScene)
                    .frame(height: 500)
//                    .border(Color.black)
                ForEach(confettiMovements.indices, id: \.self) { index in
                    Confetti(movement: $confettiMovements[index])
                    
                    
                }
            }
            .padding(.bottom, -10)
//            .frame(maxWidth: .infinity, maxHeight: 500)

            NavigationView {
                VStack{
//                    Spacer()
                    Form {
                        Section{
                            HStack{
                                Text("Speed")
                                Spacer()
                                ForEach(0..<5) { index in
                                    Image(systemName: "flame.fill")
                                        .foregroundColor(.red)
                                        .frame(width: 21.5)
                                }
                            }
                            HStack{
                                Text("Aerodynamics")
                                Spacer()
                                ForEach(0..<5) { index in
                                    Image(systemName: "car.rear.and.tire.marks")
                                        .foregroundColor(.cyan) // Optional: Set image color
                                }
                            }
                            HStack{
                                Text("Total Score")
                                Spacer()
                                Text("100")
                                    .foregroundStyle(.green)
                                    .bold()
                            }
                        }
                        
                        Section{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Play Again")
                                    .frame(maxWidth: .infinity)
                            }
//                            .foregroundColor(.blue)
                            .bold()

                        }
                        
                    }
//                    .border(Color.black)
                    .frame(maxWidth: .infinity, maxHeight: 400)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 400)
//            .border(Color.red)
            
        }
        .ignoresSafeArea()
        .onAppear {
//            loadScene()
            startAnimation()
        }
    }
    
//    func loadScene() {

            // Load race.scn or race2.scn based on conditions
//        if carGame.type == .sedan /*&& carGame.attribute.velg == ""*/ {
//                raceScene = SCNScene(named: "art.scnassets/raceSedanWin.scn")
//            } else if carGame.type == .sedan && (carGame.attribute.velg == "" || carGame.attribute.velg == "") {
//                raceScene = SCNScene(named: "art.scnassets/race2.scn")
//            } else {
//                raceScene = SCNScene(named: "art.scnassets/race.scn")
//            }
//        }

    func startAnimation() {
        isAnimating = true
        spawnConfetti()
    }

    func spawnConfetti() {
        for _ in 0..<15 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.1...3.0)) {
                let newMovement = Movement(
                    x: CGFloat.random(in: -150...150),
                    y: -300 * CGFloat.random(in: 0.7...1),
                    z: 1,
                    opacity: 1
                )
                confettiMovements.append(newMovement)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    confettiMovements.removeFirst()
                }
            }
        }
    }
}

struct Confetti: View {
    @Binding var movement: Movement

    var body: some View {
        Text("🗿")
            .frame(width: 70)
            .offset(x: movement.x, y: movement.y)
            .scaleEffect(movement.z)
            .opacity(movement.opacity)
            .animation(.easeInOut(duration: 2), value: movement.opacity)
            .onAppear {
                withAnimation(.easeOut(duration: 0.2)) {
                    movement.opacity = 1
                    movement.x = CGFloat.random(in: -150...150)
                    movement.y = -300 * CGFloat.random(in: 0.7...1)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    withAnimation(.easeIn(duration: 2)) {
                        movement.y = 200
                        movement.opacity = 0
                    }
                }
            }
    }
}
