//
//  garageView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import SwiftUI

struct garageView: View {
    @Binding var carGame: Car
    @Environment(\.presentationMode) var presentationMode2
    @State private var selectedSide = 1
//    @Binding var userInput: String
    @Binding var carSelectedColor: CGColor
    let asset = Car.getAssetsData()
    @State private var selectedCarType: CarType? = nil
    
    
    var body: some View {
        VStack{
            Spacer()
//            VS {
//                Text("yo")
//                    .foregroundStyle(Color(carSelectedColor))
                    .border(Color.black)
            GameScene(carGame: $carGame, selectedColor: $carSelectedColor)
                .scaledToFit()
                .frame(maxWidth: 400)
//            }
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
//                    .border(Color.black)
                VStack{
                    Picker("Choose picker selection", selection: $selectedSide) {
                        Text("License").tag(0)
                        Text("Body").tag(1)
                        Text("Velg").tag(2)
                    }
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                    
                    switch selectedSide {
                    case 0:
                        licenseView(scale: (.constant(0.9)), car: $carGame, isEditable: (.constant(false)))
                            .onTapGesture {
                                presentationMode2.wrappedValue.dismiss()
                            }
                        
                    case 1:
                        ScrollView(.horizontal){
                            LazyHStack {
                                ForEach(asset) { asset in
                                    cardView(asset: asset)
                                }
                                
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    case 2:
                        EmptyView()
                    default:
                        EmptyView()
                    }
                    Spacer()
                    
                    NavigationLink {
                        raceViewVersion2()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Race")
//                            .foregroundStyle(.blue)
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
                    
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: 400)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

