//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/5/24.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    @Published var statistics : [StatisticModel] = []
    
    @Published var allCoins : [ CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    @Published var searchText : String = ""
    @Published var isLoading : Bool = false
    @Published var sortOption : SortOption = .holdings
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    enum SortOption {
        case rank, rankreversed, holdings, holdingsReversed, price, priceReversed
    }
    
    init() {
        
        addSubscribers()
    }
    
    func addSubscribers () {
        
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCoins)
           
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
        
            .sink { [weak self] (returnedstats) in
                self?.statistics = returnedstats
                self?.isLoading = false
            }
            .store(in: &cancellables)
        
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntity)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
        
        let filteredCoins = filterCoins(text: text, startingCoins: coins)
        let sortedCoins = sortCoins(sort: sort, coins: filteredCoins)
        return sortedCoins
    }
    
    
    private func filterCoins(text : String , startingCoins : [CoinModel]) -> [CoinModel] {
       
        guard !text.isEmpty else {
            return startingCoins
        }
        let lowerCasedText = text.lowercased()
        return startingCoins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowerCasedText) ||
            coin.symbol.lowercased().contains(lowerCasedText) ||
            coin.id.lowercased().contains(lowerCasedText)
        }
        
    }
    
    
    private func sortCoins(sort: SortOption, coins: [CoinModel]) -> [CoinModel] {
        switch sort {
        case .rank, .holdings:
            return coins.sorted(by: { $0.rank < $1.rank })
        case .rankreversed, .holdingsReversed :
            return  coins.sorted(by: { $0.rank > $1.rank })
        case .price:
            return  coins.sorted(by: { $0.currentPrice > $1.currentPrice })
        case .priceReversed:
            return  coins.sorted(by: { $0.currentPrice < $1.currentPrice })
        }
    }
    
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    
    
    private func mapGlobalMarketData(marketdataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        
        var stats: [StatisticModel] = []
        
        guard let data = marketdataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins.map({ $0.currentHoldingsValue }).reduce(0, +)
        
        let previousValue = portfolioCoins.map { (coin) -> Double in
            let currentValue = coin.currentHoldingsValue
            let percentChange = coin.priceChangePercentage24H ?? 0 / 100
            let previousValue = currentValue / (1 + percentChange)
            return previousValue
        }
            .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100

        
        let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
       
        
       
        
        stats.append(contentsOf: [
          marketCap,
          volume,
          btcDominance,
          portfolio
        ])
        return stats
    }
}
