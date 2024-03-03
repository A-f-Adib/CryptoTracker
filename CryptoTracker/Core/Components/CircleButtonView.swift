//
//  CircleButtonView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/3/24.
//

import SwiftUI

struct CircleButtonView: View {
    var body: some View {
       Image(systemName: "heart.fill")
            .font(.headline)
            .foregroundColor(Color.theme.accent)
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
