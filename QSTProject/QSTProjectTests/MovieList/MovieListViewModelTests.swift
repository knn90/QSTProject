//
//  MovieListViewModelTests.swift
//  QSTProjectTests
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation
import XCTest

@testable import QSTProject


final class MovieListViewModelTests: XCTestCase {
    func test_getMovieList_sendRequestToService() {
        let (sut, service) = makeSUT()

        XCTAssertEqual(service.requestCallCount, 0)
        sut.getMovieList()
        XCTAssertEqual(service.requestCallCount, 1)
        sut.getMovieList()
        XCTAssertEqual(service.requestCallCount, 2)
    }

    func test_sortByTitle_ordersMovieListByTitle() {
        let movieA = MovieFactory.make(title: "a")
        let movieZ = MovieFactory.make(title: "z")
        let movieG = MovieFactory.make(title: "g")
        let stubMovies = [
            movieZ,
            movieG,
            movieA
        ]

        let (sut, _) = makeSUT(movies: stubMovies)

        sut.getMovieList()
        XCTAssertEqual(sut.movies, [movieZ, movieG, movieA])

        sut.sortByTitle()
        XCTAssertEqual(sut.movies, [movieA, movieG, movieZ])
    }

    func test_sortByTitle_ordersMovieListByReleasedDate() {
        let current = Date()
        let releaseFirst = MovieFactory.make(releasedDate: current.addingTimeInterval(-1))
        let releaseSecond = MovieFactory.make(releasedDate: current)
        let releaseLast = MovieFactory.make(releasedDate: current.addingTimeInterval(1))
        let stubMovies = [
            releaseSecond,
            releaseLast,
            releaseFirst

        ]

        let (sut, _) = makeSUT(movies: stubMovies)

        sut.getMovieList()
        XCTAssertEqual(sut.movies, [releaseSecond, releaseLast, releaseFirst])

        sut.sortByReleasedDate()
        XCTAssertEqual(sut.movies, [releaseFirst, releaseSecond, releaseLast])
    }

    private func makeSUT(movies: [Movie] = []) -> (MovieListViewModel, MovieListServiceSpy) {
        let service = MovieListServiceSpy(stubMovies: movies)
        let sut = MovieListViewModel(service: service)

        return (sut, service)
    }
}

final class MovieListServiceSpy: MovieListService {
    private(set) var requestCallCount = 0
    private let stubMovies: [Movie]

    init(stubMovies: [Movie]) {
        self.stubMovies = stubMovies
    }

    func getMovieList() -> [Movie] {
        requestCallCount += 1
        return stubMovies
    }
}

private class MovieFactory {
    static func make(
        title: String = "title",
        rating: CGFloat = 0.0,
        duration: String = "duration",
        genre: String = "genre",
        releasedDate: Date = Date(),
        description: String = "description",
        trailer: URL = URL(string: "http://url.com")!,
        poster: String = "poster",
        onWatchList: Bool = false
    ) -> Movie {
        Movie(title: title,
              rating: rating,
              duration: duration,
              genre: genre,
              releasedDate: releasedDate,
              description: description,
              trailer: trailer,
              poster: poster,
              onWatchList: onWatchList)
    }

}
