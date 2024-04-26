//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/5/24.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    @Published var statistics : [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange:1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange:-7)
        ]
    
    @Published var allCoins : [ CoinModel] = []
    
    @Published var portfolioCoins : [CoinModel] = []
    
    @Published var searchText : String = ""
    
    private let dataService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        addSubscribers()
    }
    
    func addSubscribers () {
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
           
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
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
}
