//
//  MovieCardView.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 23.05.2024.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    
    var body: some View {
       
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(movie.title).font(.headline)
                Text(movie.releaseDate)
            }
            .padding()
            Spacer()
            let url = URL(string: movie.getImageUrl())

            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 150)
                
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    MovieCardView(movie: Movie(id: 0, title: "First Avenger", releaseDate: "20-12-2012", imageUrlSuffix: "", overview: "I can do this all day!", voteAverage: 0))
}
