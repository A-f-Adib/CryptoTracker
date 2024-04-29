//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/29/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    SearchbarView(searchText: $vm.searchText)
                    
                    ScrollView (.horizontal, showsIndicators: true, content: {
                        LazyHStack(spacing: 10) {
                            ForEach(vm.allCoins) { coin in
                                Text(coin.symbol.uppercased())
                            }
                        }
                    })
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
