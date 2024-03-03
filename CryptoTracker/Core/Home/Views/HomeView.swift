//
//  HomeView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
