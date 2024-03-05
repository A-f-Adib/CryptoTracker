//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/5/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [ CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
