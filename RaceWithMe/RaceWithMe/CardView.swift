//
//  cardView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    @Binding var carGame: Car
    
    var asset: Car
    
    var body: some View {
        
        ZStack{
            Image(asset.name)
                .resizable()
                .frame(width: 300, height: 240)
                .cornerRadius(30)
                .onTapGesture {
                    DispatchQueue.global().async {
                        if let newType = CarType(rawValue: asset.type.rawValue) {
                            DispatchQueue.main.async {
                                carGame.type = newType
                            }
                        }
                    }
                }

        }
        .frame(width: 300, height: 240)
        
    }
}
