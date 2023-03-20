//
//  RestaurantDetails.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI

struct RestaurantDetails: Decodable {
    let description: String
    let popularDishes: [Dish]
    let photos: [String]
    let reviews: [Review]
}
