//
//  MovieListViewModel.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    private let service: MovieListService
    @Published var movies: [Movie] = []

    init(service: MovieListService) {
        self.service = service
    }

    func getMovieList() {
        movies = service.getMovieList()
    }

    func sortByTitle() {
        movies.sort(by: { $0.title < $1.title })
    }

    func sortByReleasedDate() {
        movies.sort(by: { $0.releasedDate < $1.releasedDate })
    }
}


