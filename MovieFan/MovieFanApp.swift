//
//  MovieFanApp.swift
//  MovieFan
//
//  Created by Svetlana Kirillova on 22.05.2024.
//

import SwiftUI

@main
struct MovieFanApp: App {
    let viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationStack {
                MoviesView().environmentObject(viewModel)
            }
            
        }
    }
}
