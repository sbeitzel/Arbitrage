//
//  World.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import Foundation

struct World: Codable {
    let towns: [Market]
    let ledger: Ledger
}

extension World {
    // how big is the world?
    static let width = 5000.0
    static let height = 5000.0

    static func example() -> World {
        var markets = [Market]()
        var names = Bundle.main.decode([String].self, from: "Towns.json")
        names.shuffle()
        for _ in 1...10 {
            markets.append(makeMarket(named: names.removeFirst()))
        }
        let ledger = Ledger(funds: Int.random(in: 200...500),
                            entries: [])
        return World(towns: markets, ledger: ledger)
    }

    private static func makeMarket(named: String) -> Market {
        Market(id: UUID().uuidString,
                              name: named,
               prices: Market.generatePrices(),
               xPos: Double.random(in: 1...4999),
               yPos: Double.random(in: 1...4999)
        )
    }
}
