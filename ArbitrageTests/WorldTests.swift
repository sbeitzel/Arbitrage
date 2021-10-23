//
//  WorldTests.swift
//  ArbitrageTests
//
//  Created by Stephen Beitzel on 10/21/21.
//

@testable import Arbitrage
import XCTest

class WorldTests: XCTestCase {

    func testMakeExample() throws {
        let exampleWorld = World.example()

        XCTAssertEqual(exampleWorld.towns.count, 10)
    }
}
