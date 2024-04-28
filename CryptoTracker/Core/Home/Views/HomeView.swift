//
//  HomeView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/3/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm : HomeViewModel
    
    @State private var showPortfolio = false
    @State private var showPortfolioView = false
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView,content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            VStack {
                
                homeHeader
                HomeStatView(showPortfolio: $showPortfolio)
                SearchbarView(searchText: $vm.searchText)
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
               
                
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView {
    
    private var homeHeader: some View {
        
        HStack {
            
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
//                .animation(.none)
                .onTapGesture {
                    if showPortfolio {
                       showPortfolioView.toggle()
                    }
                }
                .background(
                 CircleAnimationView(animate: $showPortfolio)
                )
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
            
        }
    }
    
    private var allCoinsList : some View {
        
        List {
            
            ForEach(vm.allCoins) { coin in
                
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    private var portfolioCoinsList : some View {
        
        List {
            
            ForEach(vm.portfolioCoins) { coin in
                
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles : some View {
        
        HStack {
            Text("Coin")
            Spacer()
            
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width : UIScreen.main.bounds.width / 3.0, alignment: .trailing )
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}
