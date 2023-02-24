//
//  NavigationLazyView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
