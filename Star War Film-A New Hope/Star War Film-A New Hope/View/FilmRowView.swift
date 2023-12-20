//
//  FileRow.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import SwiftUI

struct FilmRowView: View {
    var film:Film
    
    var body: some View {
        VStack(alignment:.leading){
            Text(film.title)
                .font(.title2.bold())
            Text("Release Date: \(film.releaseDate)")
        }
    }
}

#Preview {
    FilmRowView(film: Film.example)
}
