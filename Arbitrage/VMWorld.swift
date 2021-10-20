//
//  VMWorld.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import Foundation

class VMWorld: ObservableObject {

    init(from world: World) {

    }

    init() {
        
    }

    func snapshot() -> World {
        return World()
    }
}
