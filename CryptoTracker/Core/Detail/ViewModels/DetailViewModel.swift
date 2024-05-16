//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/12/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewstatistics : [StatisticModel] = []
    @Published var additionalStatistics : [StatisticModel] = []
    
    @Published var coin : CoinModel
    private let coinDetailService : CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map( { (coinDetailModel, coinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) in
                
                //overview
                let price = coinModel.currentPrice.asCurrencyWith6Decimals()
                let priceChange = coinModel.priceChangePercentage24H
                let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: priceChange)
                
                let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
                let marketCapPercentChange = coinModel.marketCapChangePercentage24H
                let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
                
                let rank = "\(coinModel.rank)"
                let rankStat = StatisticModel(title: "Rank", value: rank)
                
                let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
                let volumeStat = StatisticModel(title: "Volume", value: volume)
                
                var overViewArray: [StatisticModel] = [
                    priceStat, marketCapStat, rankStat, volumeStat
                ]
                
                //additionals
                
                
                
                return (overViewArray,[])
            })
            .sink { (returnedArrays) in
                print("Received coin details")
                print(returnedArrays.overview)
                print(returnedArrays.additional)
            }
            .store(in: &cancellables)
    }
}
