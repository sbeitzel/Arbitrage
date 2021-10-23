//
//  Good.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import Foundation

enum Good: Codable, CaseIterable, CustomStringConvertible {
    case ore, metal, gem, grain, fiber, meat, textile, garment, equipment

    enum CodingKeys: CodingKey { case rawValue }
    enum CodingError: Error { case unknownValue }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let value = try container.decode(Int.self, forKey: .rawValue)
        let allCases = Good.allCases
        if allCases.indices.contains(value) {
            self = allCases[value]
        } else {
            throw CodingError.unknownValue
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Good.allCases.firstIndex(of: self)!, forKey: .rawValue)
    }

    var description: String {
        switch self {
        case .ore: return "Ore"
        case .metal: return "Metal"
        case .gem: return "Gem"
        case .grain: return "Grain"
        case .fiber: return "Fiber"
        case .meat: return "Meat"
        case .textile: return "Textile"
        case .garment: return "Garment"
        case .equipment: return "Equipment"
        }
    }

}
