//
//  Review.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI

struct Review: Decodable, Hashable {
    let user: ReviewUser
    let rating: Int
    let text: String
}

struct ReviewUser: Decodable, Hashable {
    let id: Int
    let username, firstName, lastName, profileImage: String
}
