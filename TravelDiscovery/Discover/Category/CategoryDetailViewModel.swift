//
//  CategoryDetailViewModel.swift
//  TravelDiscovery
//
//  Created by Daniel on 2/10/23.
//

import Foundation
class CategoryDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""

    init(name: String) {
        //network code here
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(name.lowercased())".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            self.isLoading = false
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                guard let data = data else {return}
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.isLoading = false
                    self.errorMessage = "\(statusCode)"
                    return
                }
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print(error)
                    self.errorMessage = error.localizedDescription
                }
                self.isLoading = false
            }
        }.resume()
    }
}
