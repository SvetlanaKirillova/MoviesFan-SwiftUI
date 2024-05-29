//
//  MovieDetailsView.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 23.05.2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                let url = URL(string: movie.getImageUrl())
                let w = UIScreen.main.bounds.width - 50
                let h = w*1.5
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: w, height: h, alignment: .center)
                } placeholder: {
                    Image(systemName: "film")
                        .resizable()
                        .frame(width: w, height: h, alignment: .center)
                        .tint(.blue)
                        
                }
                
                Text(movie.title)
                    .font(.title)
                    .frame(alignment: .leading)
                Text("Released: \(movie.releaseDate)")
                    .multilineTextAlignment(.leading)
                Text(movie.overview)

            }
        }
        .navigationTitle(movie.title)
        .padding()
       
    }
}

#Preview {
    MovieDetailsView(movie: Movie(id: 0, title: "First Avenger", releaseDate: "20-12-2012", imageUrlSuffix: "", overview: "I can do this all day!", voteAverage: 0))
}
