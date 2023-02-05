//
//  ContentView.swift
//  landmarks
//
//  Created by Ashutosh Narang on 26/01/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelState()

    var body: some View {
        TextFieldView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelState())

    }
}
