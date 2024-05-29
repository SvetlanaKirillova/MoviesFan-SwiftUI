//
//  MovieViewModel.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 22.05.2024.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: DataError? = nil
    
    @Published private(set) var topRated: [Movie] = []
    
    private let apiService: MovieAPILogic
    
    init(apiService: MovieAPILogic = MovieAPI()) {

        self.apiService = apiService
    }
    
    func getMovies() {
        
        apiService.getMovies { [weak self] result in
            
            switch result {
            case .failure(let error):
                self?.error = error
            case .success(let movies):
                self?.movies = movies ?? []
            }
        }
    }
    
    func getTopRatedMovies() {
        
        apiService.getTopRatedMovies { [weak self] result in
            
            switch result {
            case .failure(let error):
                self?.error = error
            case .success(let movies):
                self?.topRated = movies ?? []
            }
        }
    }
}
