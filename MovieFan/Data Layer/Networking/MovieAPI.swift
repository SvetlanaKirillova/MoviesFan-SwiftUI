//
//  MovieApi.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 22.05.2024.
//

import Foundation
import Alamofire

typealias MovieAPIResponse = (Swift.Result<[Movie]?, DataError>) -> Void
//typealias TopRatedAPIResponse = (Swift.Result<[Movie], DataError>) -> Void

protocol MovieAPILogic {
    func getMovies(completion: @escaping (MovieAPIResponse))
    func getTopRatedMovies(completion: @escaping (MovieAPIResponse))
}

class MovieAPI: MovieAPILogic {
    private struct Constants {
        static let apiKey = S.movieApiKey
        static let lang = "en-US"
        static let moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=\(lang)&page=\(pageValue)"
        static let topRatedURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=\(lang)&page=\(pageValue)"
        static let pageValue = 1
        static let rParameter = "r"
        static let json = "json"
    }
    
    func getMovies(completion: @escaping (MovieAPIResponse)) {
        
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(Constants.moviesURL, method: .get, encoding: URLEncoding.default)
            .validate()
            .responseDecodable(of: MoviesResult.self) { response in
                
                switch response.result {
                case .success(let moviesResult):
                    completion(.success(moviesResult.results))
                    
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                }
            }
    }
    
    func getTopRatedMovies(completion: @escaping (MovieAPIResponse)) {
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(Constants.topRatedURL, method: .get)
            .validate()
            .responseDecodable(of: MoviesResult.self) { response in
                
                switch response.result {
                case .success(let topMovies):
                    completion(.success(topMovies.results))
                    
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                }
                
            }
        
    }
}
