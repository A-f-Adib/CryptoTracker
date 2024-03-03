//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/2/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
