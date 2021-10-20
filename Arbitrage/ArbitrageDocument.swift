//
//  ArbitrageDocument.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var atSave: UTType {
        UTType(exportedAs: "com.qbcps.ATSave", conformingTo: .json)
    }
}

class ArbitrageDocument: ReferenceFileDocument {
    typealias Snapshot = World

    @Published var world: VMWorld

    init(with world: World) {
        self.world = VMWorld(from: world)
    }

    init() {
        self.world = VMWorld()
    }

    static var readableContentTypes: [UTType] { [.atSave] }

    required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        let decodedWorld = try JSONDecoder().decode(World.self, from: data)

        world = VMWorld(from: decodedWorld)
    }

    func snapshot(contentType: UTType) throws -> Snapshot {
        return world.snapshot()
    }
    
    func fileWrapper(snapshot: Snapshot, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try JSONEncoder().encode(snapshot)
        return .init(regularFileWithContents: data)
    }
}

extension ArbitrageDocument {
    static func example() -> ArbitrageDocument {
        return ArbitrageDocument(with: World.example())
    }
}
