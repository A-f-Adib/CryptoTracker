//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/29/24.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    Text("hello")
                }
            }
            .navigationTitle("Edit portfolio")
            .toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
