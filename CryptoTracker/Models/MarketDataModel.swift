//
//  MarketDataModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/28/24.
//

import Foundation

struct Welcome {
    let data : DataClass?
}

struct DataClass {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endenIcos: Int?
    let markets: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]?
    let marketCapChangepercentage24HUsd : Double?
    let updatedAt: Int?
}
