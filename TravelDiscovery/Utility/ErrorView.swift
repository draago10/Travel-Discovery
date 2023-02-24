//
//  ErrorView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("Unsuccessful")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text("Oops, something went wrong")
                .font(.system(size: 35, weight: .semibold))
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}
