//
//  ArbitrageApp.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import SwiftUI

@main
struct ArbitrageApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ArbitrageDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
