//
//  ContentView.swift
//  landmarks
//
//  Created by Ashutosh Narang on 26/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()

    var body: some View {
        PlaygroundView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
