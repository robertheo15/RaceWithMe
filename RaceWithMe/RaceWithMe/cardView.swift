//
//  cardView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import Foundation
import SwiftUI

struct cardView: View {
    
    var asset: Car
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray)
            Text(asset.name)
        }
        .frame(width: 300, height: 240)
        
    }
}
