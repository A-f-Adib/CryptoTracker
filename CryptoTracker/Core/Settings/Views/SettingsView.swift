//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 6/28/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            List{
             
                Section(header: Text("Header"), footer: Text("Footer")) {
                    Text("Hi")
                    Text("Hi")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
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
