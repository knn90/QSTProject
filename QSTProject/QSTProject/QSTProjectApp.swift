//
//  QSTProjectApp.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import SwiftUI

@main
struct QSTProjectApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MovieListView(viewModel: MovieListViewModel(service: JSONMovieListService()))
            }


        }
    }
}
