//
//  DiscoveryCategotiesView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI
import Kingfisher
import SDWebImageSwiftUI


struct DiscoveryCategoriesView: View {
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sports", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "fork.knife"),
        .init(name: "History", imageName: "books.vertical.fill")
    ]
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink {
                        NavigationLazyView(CategoryDetailView(name: category.name))
                    } label: {
                        VStack {
                            Image(systemName: category.imageName)
                                .font(.system(size: 20))
                                .foregroundColor(Color(#colorLiteral(red: 252/255, green: 139/255, blue: 66/255, alpha: 1)))
                                .frame(width: 64, height: 64)
                                .background(Color.white)
                                .cornerRadius(64)
                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }.frame(width: 68)
                    }

                }
            }.padding(.horizontal)
        }
    }
}

struct DiscoveryCategotiesView_Previews: PreviewProvider {
    static var previews: some View {
        
        DiscoverView()
    }
}
