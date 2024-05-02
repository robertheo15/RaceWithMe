//
//  garageView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import SwiftUI
import AVFoundation
import SceneKit

struct GarageView: View {
    @Binding var carGame: Car
    @Environment(\.presentationMode) var presentationMode2
    @State private var selectedSide = 1
    let assets = Car.getAssetsData()
    @State var raceSceneCooper: SCNScene? = SCNScene(named: "art.scnassets/race.scn")
    @State var raceSceneSedan: SCNScene? = SCNScene(named: "art.scnassets/raceSedanWin.scn")
    var win: Bool = false
    
    
    let clickSound = AVPlayer(url:  Bundle.main.url(forResource: "sound_button_click2", withExtension: "mp3")!)
    
    
    var body: some View {
        VStack{
            Spacer()
                .border(Color.black)
            GameScene(carGame: $carGame)
                .scaledToFill()
                .frame(maxWidth: 400)
                .padding(.bottom, -10)
            Spacer()
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
                VStack{
                    Picker("Choose picker selection", selection: $selectedSide) {
                        Text("License").tag(0)
                        Text("Body").tag(1)
//                        Text("Velg").tag(2)
                    }
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                    
                    switch selectedSide {
                    case 0:
                        LicenseView(scale: (.constant(0.9)), car: $carGame, isEditable: (.constant(false)))
                            .onTapGesture {
                                presentationMode2.wrappedValue.dismiss()
                            }
                        
                    case 1:
                        ScrollView(.horizontal){
                            LazyHStack {
                                ForEach(assets) { asset in
                                    CardView(carGame: $carGame, asset: asset)
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
//                    case 2:
//                        EmptyView()
                    default:
                        EmptyView()
                    }
                    Spacer()
                    
                    NavigationLink {
                        
                        if carGame.type == .sedan {
                            RaceViewVersion2(raceScene: $raceSceneSedan, carGame: $carGame, win: .constant(true))
                                .navigationBarBackButtonHidden(true)
                        } else {
                            RaceViewVersion2(raceScene: $raceSceneCooper, carGame: $carGame, win: .constant(false))
                                .navigationBarBackButtonHidden(true)
                        }
                    } label: {
                        Text("Race")
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 56)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.fill)
                            .padding(.horizontal)
                    )
                    .padding(.bottom, 40)
                    .simultaneousGesture(TapGesture().onEnded {
                        clickSound.volume = 4
                        clickSound.play()
                                })
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

