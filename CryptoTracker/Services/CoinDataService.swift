//
//  CoinDataService.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/8/24.
//

import Foundation

class CoinDataService {
    
    @Published var allCoins : [CoinModel] = []
    
    init() {
        getCoins()
    }
    
    
    private func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output)-> Data in
                
                guard let respnse = output.response as? HTTPURLResponse,
                      respnse.statusCode >= 200 && respnse.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return output.data
            }
    }
}
