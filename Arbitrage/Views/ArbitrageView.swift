//
//  ArbitrageView.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import SwiftUI

struct ArbitrageView: View {
    @ObservedObject var document: ArbitrageDocument

    @State private var selectedMarket: VMMarket?

    var detailView: some View {
        Group {
            if selectedMarket == nil {
                SelectSomethingView()
            } else {
                MarketDetailView(market: selectedMarket!)
            }
        }
    }

    var body: some View {
        HStack {
            ScrollView {
                ForEach(document.world.towns) { market in
                    Text(market.name)
                        .onTapGesture {
                            selectedMarket = market
                        }
                }
            }
            detailView
        }
    }
}

struct ArbitrageView_Previews: PreviewProvider {
    static var previews: some View {
        ArbitrageView(document: ArbitrageDocument.example())
    }
}
