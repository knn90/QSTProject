//
//  JSONMovieListService.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation

private struct MoviesResponse: Decodable {
    let movies: [MovieResponse]

    func toModels() -> [Movie] {
        movies.map { $0.toModel() }
    }
}

private struct MovieResponse: Decodable {
    let title: String
    let rating: CGFloat
    let duration: String
    let genre: String
    let releasedDate: Date
    let description: String
    let trailer: URL
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title
        case rating
        case duration
        case genre
        case releasedDate = "released_date"
        case description
        case trailer = "trailer_link"
        case poster
    }

    func toModel() -> Movie {
        Movie(
            title: title,
            rating: rating,
            duration: duration,
            genre: genre,
            releasedDate: releasedDate,
            description: description,
            trailer: trailer,
            poster: poster
        )
    }
}

final class JSONMovieListService: MovieListService {
    func getMovieList() -> [Movie] {
        guard let path = Bundle.main.url(forResource: "movieList", withExtension: "json") else {
            return []
        }
        do {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "d MMMM yyyy"
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let data = try Data(contentsOf: path)
            let result = try decoder.decode(MoviesResponse.self, from: data)
            return result.toModels()
        } catch {
            print(error)
        }
        return []
    }
}
