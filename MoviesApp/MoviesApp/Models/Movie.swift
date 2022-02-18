//
//  Movie.swift
//  MoviesApp (iOS)
//
//  Created by Aashish Tyagi on 2/18/22.
//

import Foundation

struct MovieResponse: Codable {
    let movies:[Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}




struct Movie:Codable {
    
    let title:String
    let year:String
    let imdbid:String
    let poster:String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbid = "imdbID"
        case poster = "Poster"
    }
}
