//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/20/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing () {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
