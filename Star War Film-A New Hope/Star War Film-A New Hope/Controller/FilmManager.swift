//
//  FilmManager.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import Foundation

class FilmManager: ObservableObject {
    @Published var films: [Film] = []

    func loadData() async {
        guard let url = URL(string: "https://swapi.dev/api/films/?format=json") else {
            print("Invalid URL.")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(Films.self, from: data) {
                DispatchQueue.main.async {
                    self.films = decodedData.results
                }
            }
        } catch {
            print("Error loading data:", error)
        }
    }
}
