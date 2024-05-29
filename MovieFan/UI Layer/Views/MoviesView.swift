//
//  MoviesView.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 22.05.2024.
//

import SwiftUI
import Charts

struct MoviesView: View {
    
    @EnvironmentObject var moviesViewModel: MovieViewModel
    
    var body: some View {
        
        TabView {
            List {
                Section("Popular Movies") {
                    ForEach(moviesViewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailsView(movie: movie)
                        } label: {
                            MovieCardView(movie: movie)
                        }
                    }
                }
            }
            .onAppear {
                moviesViewModel.getMovies()
            }
            .tabItem {
                Label("Movies", systemImage: "popcorn.fill")
            }
            Chart {
                ForEach(moviesViewModel.topRated.prefix(5)) { movie in
                    BarMark(
                        x: .value("movie", movie.title),
                        y: .value("rate", movie.voteAverage)
                    )
                }
            }
            .onAppear {
                moviesViewModel.getTopRatedMovies()
            }
            .tabItem {
                Label("Top rates", systemImage: "star.fill")
            }
            
        }
        .navigationTitle("Movies")
        
    }
}

#Preview {
    MoviesView().environmentObject(MovieViewModel())
}
