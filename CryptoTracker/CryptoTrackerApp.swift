//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/2/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
