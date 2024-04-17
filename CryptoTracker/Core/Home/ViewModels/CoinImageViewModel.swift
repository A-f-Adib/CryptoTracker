//
//  CoinImageViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/18/24.
//

import Foundation
import SwiftUI 

class coinImageViewModel : ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading : Bool = false
    
    init() {
        getImage()
    }
    
    private func getImage() {
        
    }
}
