//
//  MarketDataService.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/28/24.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData : MarketDataModel? = nil
    var marketDataSubscribtion: AnyCancellable?
    
    init() {
        getData()
    }
    
    
     func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")
        else {
            return
        }
        
        marketDataSubscribtion =  NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobaldata) in
                self?.marketData = returnedGlobaldata.data
                self?.marketDataSubscribtion?.cancel()
            })
     }
}
