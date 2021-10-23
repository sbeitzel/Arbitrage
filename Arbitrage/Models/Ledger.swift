//
//  Ledger.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/21/21.
//

import Foundation

struct Ledger: Codable {
    let funds: Int
    let entries: [MarketEntry]
}

struct MarketEntry: Codable {
    let marketID: String
    let turnNumber: Int
    let inventory: [Good: Int] // what the player has at that place
    let prices: [Good: Int] // what the cost of goods is at this place and time
}

struct PriceReport: Codable {
    let marketID: String
    let turnNumber: Int
    let prices: [Good: Int]
}
