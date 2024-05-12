//
//  DetailView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 5/12/24.
//

import SwiftUI

struct DetailView: View {
    let coin : CoinModel
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
