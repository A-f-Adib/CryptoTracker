//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/10/24.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType)
    {
        generator.notificationOccurred(type)
    }
    
}
