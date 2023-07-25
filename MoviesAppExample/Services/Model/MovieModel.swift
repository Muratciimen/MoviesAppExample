//
//  MovieModel.swift
//  MoviesAppExample
//
//  Created by Murat Çimen on 21.07.2023.
//

import Foundation

// MARK: MovieModel

struct MovieModel: Codable{
    let results : [Movie]
}

// MARK: Movie
struct Movie: Codable{
    let title, overView: String
    let voteAverage: Double
    let posterPath: String
    let date: String
    var movieImage: String{
        return "https://image.tmdb.org/t/p/w500/\(posterPath)"
    }
    
    enum CodingKeys: String, CodingKey{
        case title
        case overView = "overview"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case date = "release_date"
    }
}
