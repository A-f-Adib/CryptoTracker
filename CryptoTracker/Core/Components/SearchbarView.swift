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
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView()
    }
}
