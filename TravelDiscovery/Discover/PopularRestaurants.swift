//
//  PopularRestaurants.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI

struct PopularRestaurants: View {
    var title: String
    var height: CGFloat
    var width: CGFloat
    let restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill")
    ]
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 8) {
                    ForEach(restaurants, id: \.self) { restaurant in
                        HStack (spacing: 8) {
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .padding(.leading, 6)
                                .padding(.top, 6)
                                .padding(.bottom, 6)
                                .cornerRadius(5)
                            VStack(alignment: .leading, spacing: 5){
                                HStack {
                                    Text(restaurant.name)
                                    Spacer()
                                    Button(action: {}) {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.gray)
                                    }
                                }
                                HStack {
                                    Image(systemName: "star.fill")
                                    Text("4.7 • Sushi • $$")
                                }
                                Text("Tokyo, Japan")
                            }
                            .font(.system(size: 12, weight: .semibold))
                            Spacer()
                        }
                        .frame(width: width)
                        .asTile()
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}
struct PopularRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurants(title: "Popular Restaurants", height: 65, width: 240)
        DiscoverView()
    }
}
