//
//  DetailView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/12/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}


struct DetailView: View {
    
    @StateObject var vm : DetailViewModel
    
   
    
    init(coin: CoinModel) {
       _vm = StateObject(wrappedValue: DetailViewModel(coin: coin ))
        print("detail view for \(coin.name)")
    }
    
    var body: some View {
        Text("HEllO")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
