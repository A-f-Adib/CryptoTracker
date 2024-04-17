//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/1/24.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: coinImageViewModel = coinImageViewModel()
    
    var body: some View {
        ZStack{
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
