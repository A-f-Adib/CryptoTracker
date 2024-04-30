//
//  PortfolioDataService.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/1/24.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let container : NSPersistentContainer
    private let containerName : String = "PortfolioContainer"
    
    init() {
        container = NSPersistentContainer(name: containerName)
    }
}
