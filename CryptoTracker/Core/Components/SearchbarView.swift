//
//  SearchbarView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/20/24.
//

import SwiftUI

struct SearchbarView: View {
    
    @Binding var searchText : String
    
    var body: some View {
      
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? .gray : Color.theme.accent)
            
            TextField("Search Coin", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .overlay(
                  Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundColor(Color.theme.accent)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture(perform: {
                        searchText = ""
                    })
                  , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.2), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(searchText: .constant(""))
    }
}
