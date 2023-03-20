//
//  RestaurantDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI

class RestuarantsDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var details: RestaurantDetails?

    init() {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"

        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.details = try? JSONDecoder().decode(RestaurantDetails.self, from: data)
            }
        }.resume()

    }
}
