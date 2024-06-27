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
    
    @StateObject private var vm : DetailViewModel
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
   
    private let spacing : CGFloat = 20
    
    init(coin: CoinModel) {
       _vm = StateObject(wrappedValue: DetailViewModel(coin: coin ))
     
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    overViewTitle
                    Divider()
                    
                    ZStack {
                        if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                            VStack(alignment: .leading) {
                                Text(coinDescription)
                                    .lineLimit(3)
                                    .font(.callout)
                                    .foregroundColor(Color.theme.secondaryText)
                                
                                Button(action: {
                                    
                                }, label: {
                                    Text("Read More")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(.vertical, 4)
                                })
                                    .accentColor(.blue)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                   overViewGrid
                    
                   additionalTitle
                    Divider()
                   additionalGrid
                    
                }
                .padding()
            }
        }
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}


extension DetailView {
    
    private var navigationBarTrailingItems : some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overViewTitle : some View {
        
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overViewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.overviewstatistics) { stat in
                    StatisticView(stat: stat)
                }
            })
    }
    
    private var additionalGrid : some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            pinnedViews: [],
            content: {
                ForEach(vm.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            })
    }
}
