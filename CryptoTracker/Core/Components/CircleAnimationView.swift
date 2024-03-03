//
//  CircleAnimationView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 3/3/24.
//

import SwiftUI

struct CircleAnimationView: View {
    
    @State var animate = false
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation( animate ? Animation.easeOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

struct CircleAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleAnimationView()
            .foregroundColor(.blue)
            .frame(width: 100, height: 100)
    }
}
