//
//  PreviewProvider.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/4/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
}
