//
//  Film.swift
//  Star War Film-A New Hope
//
//  Created by Hmoo Myat Theingi on 20/12/2023.
//

import Foundation
struct Films: Codable {
    let results: [Film]
}
struct Film: Codable,Identifiable {
var id=UUID()
let title: String
let episodeID: Int
let director:String
let releaseDate: String
let starships: [String]


enum CodingKeys: String, CodingKey {
    case title
    case episodeID = "episode_id"
    case releaseDate = "release_date"
    case starships
    case director
}

    static let example = Film(
        title: "Unknown title",
        episodeID: 1,
        director: "Unknown director",
        releaseDate: "1111-11-11",
        starships: [
            "https://swapi.dev/api/starships/2/",
            "https://swapi.dev/api/starships/3/",
            "https://swapi.dev/api/starships/5/",
            "https://swapi.dev/api/starships/9/",
            "https://swapi.dev/api/starships/10/",
            "https://swapi.dev/api/starships/11/",
            "https://swapi.dev/api/starships/12/",
            "https://swapi.dev/api/starships/13/"
            
        ]
    )
    
}

struct Starship:Codable,Hashable{
    var name:String   
}

