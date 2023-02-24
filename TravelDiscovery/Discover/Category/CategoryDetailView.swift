//
//  CategoryDetailView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryDetailView: View {

    private let name : String
    @ObservedObject private var vm: CategoryDetailViewModel

    init(name: String ) {
        self.name = name
        self.vm = .init(name: name)
    }

    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                    ActivityIndicatorView()
                    Text("Loading")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                .background(Color.init(white: 0.50, opacity: 1))
                .cornerRadius(10)
            } else {
                ZStack {
                    if !vm.errorMessage.isEmpty {
                        ErrorView()
                    } else {
                        ScrollView {
                            ForEach(vm.places, id: \.self) { place in
                                VStack (alignment: .leading,spacing: 0) {
                                    WebImage(url: URL(string: place.thumbnail))
                                        .resizable()
                                        .indicator(.activity)
                                        .transition(.fade(duration: 0.5))
                                        .scaledToFill()
                                    Text(place.name)
                                        .font(.system(size: 12, weight: .semibold))
                                        .padding()
                                }.asTile()
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(name: "Art")
    }
}
