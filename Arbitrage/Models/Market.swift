//
//  Market.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import Foundation

struct Market: Codable, Identifiable {
    static let example = Market(id: UUID().uuidString,
                                name: "Example Market",
                                prices: generatePrices(),
                                xPos: 500.0,
                                yPos: 500.0)

    let id: String
    let name: String
    
    // Our first implementation of a market is going to be really simple.
    // We won't fluctuate prices and we won't ever run out of supply or demand.
    // For each good, there's just a price.
    let prices: [Good: Int]

    // a market is at a particular place in the world
    let xPos: Double
    let yPos: Double

    static func generatePrices() -> [Good: Int] {
        [.ore: Int.random(in: 1...5),
         .metal: Int.random(in: 6...10),
         .equipment: Int.random(in: 10...20),
         .gem: Int.random(in: 20...25),
         .grain: Int.random(in: 1...5),
         .fiber: Int.random(in: 3...7),
         .meat: Int.random(in: 5...10),
         .textile: Int.random(in: 8...14),
         .garment: Int.random(in: 10...20)
        ]
    }
}
