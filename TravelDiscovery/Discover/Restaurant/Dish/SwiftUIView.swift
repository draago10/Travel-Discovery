//
//  SwiftUIView.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI
import Kingfisher

struct DishCell: View {
    let dish: Dish
    var body: some View {
        VStack (alignment: .leading){
            ZStack (alignment: .bottomLeading){
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2)
                    .padding(.vertical, 2)
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                Text(dish.price)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                    .padding(.leading, 8)
                    .font(.system(size: 13, weight: .bold))
            }.frame(height: 120)
                .cornerRadius(5)
            Text(dish.name)
                .font(.system(size: 14, weight: .regular))
            Text("\(dish.numPhotos) photos")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular))
        }
    }
}
