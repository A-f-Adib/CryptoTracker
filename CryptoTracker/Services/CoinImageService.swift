//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/1/24.
//

import Foundation
import SwiftUI
import Combine
 
class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var ImageSubscription : AnyCancellable?
    
    
    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString : String) {
        
        guard let url = URL(string: urlString)
        else {
            return
        }
        
           ImageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.ImageSubscription?.cancel()
            })
    }
}
