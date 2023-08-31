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

    private func makeSUT() -> (MovieListViewModel, MovieListServiceSpy) {
        let service = MovieListServiceSpy()
        let sut = MovieListViewModel(service: service)

        return (sut, service)
    }
}

final class MovieListServiceSpy: MovieListService {
    private(set) var requestCallCount = 0

    func getMovieList() {
        requestCallCount += 1
    }
}

