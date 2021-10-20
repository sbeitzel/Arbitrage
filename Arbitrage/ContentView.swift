//
//  ContentView.swift
//  Arbitrage
//
//  Created by Stephen Beitzel on 10/20/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ArbitrageDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(ArbitrageDocument()))
    }
}
