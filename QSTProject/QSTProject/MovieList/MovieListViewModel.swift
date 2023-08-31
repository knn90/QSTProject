//
//  MovieListViewModel.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    private let service: MovieListService

    init(service: MovieListService) {
        self.service = service
    }

    func getMovieList() {
        service.getMovieList()
    }
}


protocol MovieListService {
    func getMovieList()
}
