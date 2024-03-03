//
//  CoinModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/3/24.
//

import Foundation

struct CoinModel {
        let id, symbol, name: String?
        let image: String?
        let currentPrice : Double
        let marketCap, marketCapRank, fullyDilutedValuation: Double?
        let totalVolume, high24H, low24H: Double?
        let priceChange24H, priceChangePercentage24H: Double?
        let marketCapChange24H: Double?
        let marketCapChangePercentage24H: Double?
        let circulatingSupply, totalSupply, maxSupply, ath: Double?
        let athChangePercentage: Double?
        let athDate: String?
        let atl, atlChangePercentage: Double?
        let atlDate: String?
        let lastUpdated: String?
        let priceChangePercentage24HInCurrency: Double?
    

}
