//
//  StarshipManager.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import Foundation

class StarshipController: ObservableObject {
    @Published var starships: [Starship] = []
    @Published var isLoading: Bool = true

    func loadStarships(urls: [String]) async {
        for url in urls {
            guard let starshipURL = URL(string: url) else {
                print("Invalid Starship URL")
                continue
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: starshipURL)
                let starship = try JSONDecoder().decode(Starship.self, from: data)
                self.starships.append(starship)
            } catch {
                print("Error decoding starship JSON: \(error)")
            }
        }

        isLoading = false
    }
}
