//
//  NetworkingManager.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/31/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output)-> Data in
                
                guard let respnse = output.response as? HTTPURLResponse,
                      respnse.statusCode >= 200 && respnse.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
