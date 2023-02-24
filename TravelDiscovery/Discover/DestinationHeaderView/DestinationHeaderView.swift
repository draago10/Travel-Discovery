//
//  DestinationHeaderView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/24/23.
//

import SwiftUI

struct DestinationHeaderView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct DestinationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderView()
    }
}
