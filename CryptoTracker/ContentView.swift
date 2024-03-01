//
//  ContentView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
            Text("accent color")
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}
