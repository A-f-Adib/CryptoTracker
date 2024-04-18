//
//  LocalFileManger.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/18/24.
//

import Foundation
import SwiftUI

//Save image and get image from file manager

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() { }
    
    func saveImage(image: UIImage) {
        
        guard let data = image.pngData(),
              let url = URL(string: "")
        else {
            return
        }
        
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image \(error)")
        }
    }
}
