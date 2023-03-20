//
//  RestaurantDetailsView.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/16/23.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    @ObservedObject var vm = RestuarantsDetailsViewModel()

    let restaurants: Restaurant

    var body: some View {
        ScrollView {
            ZStack (alignment: .bottomLeading){
                Image(restaurants.imageName)
                    .resizable()
                    .scaledToFill()
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(restaurants.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.orange)
                        }
                    }
                    Spacer()
                    Text("See more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
            }
            VStack (alignment: .leading, spacing: 8) {
                Text("Location & Description")
                    .font(.system(size: 16, weight: .bold))
                Text("Tokyo, Japan")
                HStack {
                    ForEach(0..<3, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }
                Text(vm.details?.description ?? "")
                    .padding(.top, 8)
                    .font(.system(size: 14, weight: .regular))
            }.padding()

            HStack {
                Text("Popular Dishes")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }.padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 16) {
                    ForEach(vm.details?.popularDishes ?? [], id: \.self) { dish in
                        DishCell(dish: dish)
                    }
                }.padding(.horizontal)
            }
            if let reviews = vm.details?.reviews {
                ReviewsList(reviews: reviews)
            }
        }
        .navigationTitle("Restaurant Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurants: .init(name: "Japan's Finest Tapas", imageName: "tapas"))
        }
    }
}
