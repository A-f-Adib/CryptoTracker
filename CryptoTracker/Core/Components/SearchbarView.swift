//
//  SearchbarView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/20/24.
//

import SwiftUI

struct SearchbarView: View {
    
    @State var searchText : String = ""
    
    var body: some View {
      
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search Coin", text: $searchText)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.2), radius: 10, x: 0, y: 0)
        )
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView()
    }
}
