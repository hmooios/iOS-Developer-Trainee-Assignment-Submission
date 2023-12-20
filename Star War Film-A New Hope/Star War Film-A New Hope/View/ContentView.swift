//
//  ContentView.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import SwiftUI

// ContentView.swift

import SwiftUI

struct ContentView: View {
    @StateObject private var filmManager = FilmManager()

    var body: some View {
        NavigationView {
            List(filmManager.films, id: \.id) { film in
                NavigationLink(destination: FilmDetailsView(film: film)) {
                    FilmRowView(film: film)
                }
            }
            .navigationTitle("Star Wars Films")
        }
        .task {
            await filmManager.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
