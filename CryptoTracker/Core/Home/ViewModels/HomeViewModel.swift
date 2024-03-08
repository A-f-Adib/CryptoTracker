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
    
    private let dataService = CoinDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers () {
        dataService.$allCoins
    }
}
