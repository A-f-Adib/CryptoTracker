//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/1/24.
//

import SwiftUI

class coinImageViewModel : ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading : Bool = false
    
    init() {
        getImage()
    }
    
    private func getImage() {
        
    }
}

struct CoinImageView: View {
    @StateObject var vm: coinImageViewModel = coinImageViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView()
    }
}
