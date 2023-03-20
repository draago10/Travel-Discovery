//
//  ReviewList.swift
//  TravelDiscovery
//
//  Created by Daniel on 3/20/23.
//

import SwiftUI
import Kingfisher

struct ReviewsList: View {
    let reviews : [Review]
    var body: some View {
        HStack {
            Text("Customer Reviews")
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }.padding(.horizontal)
        ForEach(reviews, id: \.self) { review in
            VStack {
                HStack {
                    KFImage(URL(string: review.user.profileImage))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                        .clipShape(Circle())
                    VStack (alignment: .leading, spacing: 4) {
                        Text("\(review.user.firstName) \(review.user.lastName)")
                            .font(.system(size: 14, weight: .bold))
                        HStack(spacing: 4){
                            ForEach(0..<review.rating, id: \.self) { star in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                            ForEach(0..<5 - review.rating, id: \.self) { star in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.gray)
                            }
                        }.font(.system(size: 12))
                    }
                    Spacer()
                    Text("Dec 2020")
                        .font(.system(size: 14, weight: .bold))
                }
                Text(review.text)
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}
