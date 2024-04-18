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
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        
        guard let data = image.pngData(),
              let url = getUrlForImage(folderName: folderName, imageName: imageName)
        else {
            return
        }
        
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error saving image \(error)")
        }
    }
    
    
    private func createFolderIfneed(folderName : String) {
        guard let url = getUrlForFolder(folderName: folderName) else {
            return
        }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch let error {
                print("Error creating folder \(error)")
            }
        }
    }
    
    
    private func getUrlForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    
    private func getUrlForImage(folderName: String, imageName: String) ->URL? {
        
        guard let folderURL = getUrlForFolder(folderName: folderName) else {
            return nil
        }
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
