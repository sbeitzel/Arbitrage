//
//  VMLedger.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/21/21.
//

import Foundation

class VMLedger: ObservableObject {
    @Published var funds: Int
    @Published var entries: [MarketEntry]

    init() {
        funds = 0
        entries = []
    }

    init(from ledger: Ledger) {
        funds = ledger.funds
        entries = ledger.entries
    }

    func snapshot() -> Ledger {
        return Ledger(funds: funds, entries: entries)
    }
}
