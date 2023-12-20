//
//  FilmDetailsView.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import SwiftUI

struct FilmDetailsView: View {
    var film: Film
    @StateObject private var starshipController = StarshipController()

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 16) {
                Text("Release Date: \(film.releaseDate)")
                    .foregroundColor(.secondary)
                Text("Director: \(film.director)")
                    .foregroundColor(.secondary)
                    .padding(.bottom, 16)

                Text("Starship Names:")
                    .font(.headline)
                    .fontWeight(.bold)

                if starshipController.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .padding(.vertical)
                } else {
                    ForEach(starshipController.starships, id: \.self) { starship in
                        LazyHStack {
                            Text(starship.name)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.bottom, 3)
                    }
                }
            }
            .padding()
            .navigationTitle(film.title)
            .task {
                await starshipController.loadStarships(urls: film.starships)
            }
        }
    }
}

#Preview {
    FilmDetailsView( film: Film.example)
}
