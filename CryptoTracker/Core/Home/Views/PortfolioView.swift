//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/29/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    SearchbarView(searchText: $vm.searchText)
                    coinLogoList
                    }
            }
            .navigationTitle("Edit portfolio")
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    XMarkButton()
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension PortfolioView {
    
    private var coinLogoList: some View {
        
        ScrollView (.horizontal, showsIndicators: true, content: {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                  CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture(perform: {
                            withAnimation(.easeInOut) {
                                selectedCoin = coin
                            }
                        })
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedCoin?.id == coin.id ? Color.blue : Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        })
    }
}
