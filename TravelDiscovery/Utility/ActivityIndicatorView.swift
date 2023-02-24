//
//  ActivityIndicatorView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        view.color = .white
        return view
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {

    }

    typealias UIViewType = UIActivityIndicatorView
}
