//
//  CoinDetailModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/12/24.
//

import Foundation

struct CoinDetailModel {
    let id, symbol, name: String?
    let blockTimeInMinutes : Int?
    let hashingAlgorithm: String?
    let categories: [String]?
    let welcomeDescription: Description?
    let links: Links?
}

struct Links {
    let homepage: [String]?
    let subredditURL: String?
}

struct Description {
    let en: String?
}
