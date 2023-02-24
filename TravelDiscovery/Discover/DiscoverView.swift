//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Daniel on 1/5/23.
//

import SwiftUI

extension Color {
    static let discoverBackground = Color(.init(white: 0.95, alpha: 1))
}

struct DiscoverView: View {

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient.init(colors: [Color(#colorLiteral(red: 0.9993175864, green: 0.6934975982, blue: 0.2652740777, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.3783358849, blue: 0.1412398149, alpha: 1))]), startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                Color.discoverBackground
                    .offset(y: 400)
                ScrollView (.vertical) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.init(white: 1, opacity: 0.3))
                        .cornerRadius(10)
                        .padding(16)
                    DiscoveryCategoriesView()
                    VStack {
                        PopularDestinationsView(title: "Popular destinations", height: 150, width: 125)
                        PopularRestaurants(title: "Popular Restaurants", height: 65, width: 240)
                        TrendingCreatorsView(title: "Trending Creators", height: 50, width: 50)
                    }
                    .background(Color.discoverBackground)
                    .cornerRadius(16)
                    .padding(.top, 32)
                    
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

