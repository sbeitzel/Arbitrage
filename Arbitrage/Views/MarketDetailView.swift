//
//  MarketDetailView.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/22/21.
//

import SwiftUI

struct MarketDetailView: View {
    @ObservedObject var market: VMMarket
    
    var body: some View {
        VStack {
            Text(market.name)
                .font(.headline)
            /*
             This is only available in macOS 12.0+ so until then I've got to
             come up with a less attractive solution.

            Table(market.prices) {
                TableColumn("Good", value: \.good)
                TableColumn("Price", value: \.price)
            }
             */
            ForEach(market.prices) { price in
                HStack {
                    Text(price.good.description)
                    Text("\(price.price)")
                }
            }
        }
    }
}

struct MarketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MarketDetailView(market: VMMarket(from: Market.example))
    }
}
