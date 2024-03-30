//
//  NetworkingManager.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/31/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse : return "Bad url response"
            case .unknown : return "Unknown Error"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleUrlResponse(output: $0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    static func handleUrlResponse(output:  URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let respnse = output.response as? HTTPURLResponse,
              respnse.statusCode >= 200 && respnse.statusCode < 300 else {
                  throw NetworkingError.badUrlResponse
              }
        return output.data
        
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
