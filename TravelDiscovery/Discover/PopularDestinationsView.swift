//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    var title: String
    var height: CGFloat
    var width: CGFloat
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.855014, longitude: 2.341231),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.67988, longitude: 139.7695),
        .init(name: "New York", country: "US", imageName: "new_york", latitude: 40.71592, longitude: -74.0055),
    ]
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top)

            ScrollView(.horizontal) {
                HStack(spacing: 8.0) {
                    ForEach(destinations, id: \.self) { destination in
                        NavigationLink(
                            destination:NavigationLazyView(PopularDestinationDetailsView(destination: destination)),
                            label: {
                                PopularDestinationTile(destination: destination)
                            })
                        .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct DestinationDetails: Decodable {
    let photos: [String]
    let description: String

}

class DestinationDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destinationDetails: DestinationDetails?

    init(name: String) {
        let fixedURL = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: fixedURL) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {return}
                do {
                    self.destinationDetails = try JSONDecoder().decode(DestinationDetails.self, from: data)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

struct PopularDestinationDetailsView: View {
    @ObservedObject var vm: DestinationDetailsViewModel
    let destination: Destination
    @State var region : MKCoordinateRegion
    @State var isShowingAttractions = false
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
        self.vm = .init(name: destination.name)
    }
    var body: some View {
        ScrollView {
            if let photos = vm.destinationDetails?.photos {
                DestinationHeaderView(imageNames: photos)
                    .frame(height: 250)
            }
            VStack (alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(.label))
                Text(destination.country)
                    .foregroundColor(.gray)
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top, 2)
                Text(vm.destinationDetails?.description ?? "")
                    .padding(.top, 4)
                    .font(.system(size: 14))
                HStack {Spacer()}
            }
            .padding(.horizontal)
            HStack {
                Text("Location")
                    .bold()
                Spacer()
                Button(action: {isShowingAttractions.toggle()}) {
                    Text("\(isShowingAttractions ? "Hide" : "Show") Attractions")
                        .font(.system(size: 12, weight: .semibold))
                }
                Toggle("", isOn: $isShowingAttractions)
                    .labelsHidden()
            }.padding(.horizontal)

            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ?  attractions : []) { attraction in
                MapAnnotation(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    VStack {
                        Image(attraction.imageName)
                            .resizable()
                            .frame(width: 80, height: 50)
                            .cornerRadius(3)
                        Text(attraction.name)
                            .font(.system(size: 10, weight: .semibold))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 300)

        }.navigationTitle(destination.name)
            .navigationBarTitleDisplayMode(.inline)
    }

    let attractions: [Attraction] = [
        .init(name: "Eiffel Tower", imageName: "eiffel_tower", latitude: 48.858605, longitude: 2.2946),
        .init(name: "Champs-Elysees", imageName: "new_york", latitude: 48.866867, longitude: 2.311780),
        .init(name: "Louvre Museum", imageName: "art2", latitude: 48.860288, longitude: 2.337789)
    ]
}

struct Attraction: Identifiable {
    var id = UUID().uuidString
    let name, imageName: String
    let latitude, longitude: Double
}

struct PopularDestinationTile: View {
    let destination: Destination
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(4)
                .padding(.horizontal, 6)
                .padding(.vertical, 6)
            Text(destination.name)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .foregroundColor(Color(.label))

            Text(destination.country)
                .font(.system(size: 12, weight: .semibold))
                .padding(.horizontal, 12)
                .padding(.bottom, 8)
                .foregroundColor(.gray)
        }
        .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailsView(destination: .init(name: "Paris", country: "France", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
        DiscoverView()


    }
}
