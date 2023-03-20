//
//  Dish.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}
