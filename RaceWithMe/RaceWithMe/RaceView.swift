//
//  raceView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import Foundation
import SwiftUI

struct RaceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
//                    RaceScene().scaledToFill().ignoresSafeArea()
//                            .frame(maxWidth: 400)
                }
                Spacer()
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
                        .foregroundColor(.blue)
                        .bold()

                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 252)
            }
            .tint(Color.orange)
        }
        
    }
}

#Preview {
    RaceView()
}
