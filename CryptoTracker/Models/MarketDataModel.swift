//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/28/24.
//

import Foundation

struct GlobalData: Codable {
    let data : MarketDataModel?
}

struct MarketDataModel : Codable {
   
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangepercentage24HUsd : Double
  
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapPercentage24HUsd = "market_cap_percentage_24h_usd"
        
        
    }
}
