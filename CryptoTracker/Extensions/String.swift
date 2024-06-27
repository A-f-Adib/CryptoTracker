//
//  String.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 6/27/24.
//

import Foundation

extension String {
    
    var removingHTMLOccurances : String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
