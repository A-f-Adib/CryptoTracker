//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/4/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin : CoinModel
    
    var body: some View {
        HStack(spacing : 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin)
    }
}
