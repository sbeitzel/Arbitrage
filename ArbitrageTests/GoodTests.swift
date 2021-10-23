//
//  GoodTests.swift
//  ArbitrageTests
//
//  Created by Stephen Beitzel on 10/20/21.
//

@testable import Arbitrage
import XCTest

class GoodTests: XCTestCase {

    func testCodable() throws {
        for good in Good.allCases {
            let goodData = try JSONEncoder().encode(good)
            let readGood = try JSONDecoder().decode(Good.self, from: goodData)
            XCTAssertEqual(good, readGood)
        }
    }

}
