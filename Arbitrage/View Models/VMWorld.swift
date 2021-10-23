//
//  VMWorld.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import Foundation

class VMWorld: ObservableObject {
    // we've got some markets
    @Published var towns: [VMMarket]

    @Published var ledger: VMLedger
    

    init(from world: World) {
        ledger = VMLedger(from: world.ledger)
        towns = [VMMarket]()
        for market in world.towns {
            towns.append(VMMarket(from: market))
        }
    }

    /// Initializer called when we're creating a brand new game.
    init() {
        towns = [VMMarket]()
        ledger = VMLedger()
    }

    func snapshot() -> World {
        var markets = [Market]()
        for town in towns {
            markets.append(town.snapshot())
        }
        return World(towns: markets, ledger: ledger.snapshot())
    }
}
