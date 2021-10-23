//
//  VMMarket.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/21/21.
//

import Foundation

class VMMarket: ObservableObject, Identifiable, Hashable {
    static func == (lhs: VMMarket, rhs: VMMarket) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    @Published var name: String
    @Published var xPos: Double
    @Published var yPos: Double
    @Published var prices: [VMPrice]

    init(from market: Market) {
        var pricesList = [VMPrice]()
        for good in Good.allCases {
            let price = market.prices[good] ?? 0
            pricesList.append(VMPrice(id: good.description, good: good, price: price))
        }
        id = market.id
        name = market.name
        prices = pricesList
        xPos = market.xPos
        yPos = market.yPos
    }

    init() {
        id = UUID().uuidString
        name = "Ghost Town"
        prices = [VMPrice]()
        xPos = Double.random(in: 1..<5000)
        yPos = Double.random(in: 1..<5000)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    func snapshot() -> Market {
        var priceDict = [Good: Int]()
        for price in prices {
            priceDict[price.good] = price.price
        }
        return Market(id: id, name: name, prices: priceDict, xPos: xPos, yPos: yPos)
    }
}

