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
        DocumentGroup(
            newDocument: { ArbitrageDocument(with: World.example()) },
            editor: { file in
                ArbitrageView(document: file.document)
            }
        )
    }
}
