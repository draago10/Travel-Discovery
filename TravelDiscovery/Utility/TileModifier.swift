//
//  TileModifier.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifier())
    }
}

struct TileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(.white))
            .cornerRadius(5)
            .shadow(color: .init(white: 0.8), radius: 4, x: 0.0, y: 2)
    }
}
