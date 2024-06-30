//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 6/28/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://a-f-adib.github.io/resume/")!
    
    var body: some View {
        NavigationView{
            List{
                    swiftfulthinkingSection
                    coingeckoSection
                    developerSection
                    applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .navigationTitle("About The App")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulthinkingSection: some View {
        
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was by swiftful thinking course on youtube. It uses MVVM Architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Yutube", destination: youtubeURL)
            Link("Support coffee addiction", destination: coffeeURL)
        }
    }
    
    
    private var coingeckoSection: some View {
        
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was by swiftful thinking course on youtube. It uses MVVM Architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Coingecko", destination: coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was by A.F.Adib an passionate iOS developer. It uses MVVM Architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Adib's portfolio", destination: personalURL)
        }
    }
    
    private var applicationSection: some View {
        
        Section(header: Text("Application")) {
            Link("Terms of service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }
}
