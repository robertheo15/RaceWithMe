//
//  AtributteControl.swift
//  RaceWithMe
//
//  Created by robert theo on 29/04/24.
//

import SwiftUI

struct AtributteControl: View {
    @State private var selectedSide = 1
    var body: some View {
        Picker("Choose the SIGs you joined", selection: $selectedSide) {
            Text("Selected SIGs").tag(0)
            Text("All").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

#Preview {
    AtributteControl()
}
