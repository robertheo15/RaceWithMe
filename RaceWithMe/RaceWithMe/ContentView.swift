//
//  ContentView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 29/04/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var car: Car = Car(id: 2, type: CarType.cooper, carNumber: "", name: "", attribute: CarAttribute(velg: "abc"), speedBase: 10, finalSpeed: 100)
    
    let clickSound = AVPlayer(url:  Bundle.main.url(forResource: "sound_button_click1", withExtension: "mp3")!)
    
    @State private var scale = 1.01
//    @State var userInput = ""
    @State private var isTapped = false
    @State private var isEditable = true
    @State private var carSelectedColor: CGColor = UIColor.blue.cgColor
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                LicenseView(scale: $scale, car: $car, isEditable: $isEditable)
                    .onTapGesture {
                        withAnimation {
                            scale = scale + 0.05
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                scale = scale - 0.05
                            }
                        }
                    }
                    .ignoresSafeArea()
                Spacer()
                
                NavigationLink {
                    GarageView(carGame: $car)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(trailing:
                                                ColorPicker("Select Color", selection: $carSelectedColor)
                        .toolbarBackground(.black, for: .navigationBar)
                                            
                        )
                        .navigationBarItems(leading:
                                                LicenseView(scale: (.constant(0.2)), car:$car, isEditable: (.constant(false)))
                        .frame(width: 60, height: 35)
                        )
                        .navigationTitle("Garage")
                        .navigationBarTitleDisplayMode(.inline)
                        .labelsHidden()
                } label: {
                    Text("Start")
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity, maxHeight: 56)
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .opacity(0.4)
                        .padding(.horizontal)
                )
                
                .padding(.bottom, 40)
                .simultaneousGesture(TapGesture().onEnded {
                    clickSound.volume = 2
                    clickSound.play()
                            })
            }
            .background(
                GameScene(carGame: $car).scaledToFill()

            )
            .padding(.top, 40)
            .ignoresSafeArea()
        }
    }
}


#Preview {
    ContentView()
}
