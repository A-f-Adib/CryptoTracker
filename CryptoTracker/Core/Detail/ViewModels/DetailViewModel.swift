//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/12/24.
//

import Foundation
import Combine

class DetailViewModel {
    
    private let coinDetailService : CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
    }
}
