//
//  MovieData.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 22.05.2024.
//

import Foundation

struct Constants {
    static let baseImageUrl = "https://image.tmdb.org/t/p/"
    static let logoSize = "w500"
}

struct MoviesResult: Codable {
    
    let page: Int
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    
    var id: Int
    let title: String
    let releaseDate: String
    let imageUrlSuffix: String
    let overview: String
    let voteAverage: Double
    
    func getImageUrl() -> String {
        
        return "\(Constants.baseImageUrl)/\(Constants.logoSize)/\(imageUrlSuffix)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case overview
        case imageUrlSuffix = "poster_path"
        case voteAverage = "vote_average"
    }
}
