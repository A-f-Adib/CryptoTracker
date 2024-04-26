//
//  HomeStatView.swift
//  CryptoTracker
//
//  Created by A.f. Adib on 4/27/24.
//

import SwiftUI

struct HomeStatView: View {
    let statistics : [StatisticModel] = [
    StatisticModel(title: "Title", value: "Value", percentageChange:1),
    StatisticModel(title: "Title", value: "Value"),
    StatisticModel(title: "Title", value: "Value"),
    StatisticModel(title: "Title", value: "Value", percentageChange:-7)
    ]
    var body: some View {
        HStack {
            ForEach(statistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
}

struct HomeStatView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatView()
    }
}
