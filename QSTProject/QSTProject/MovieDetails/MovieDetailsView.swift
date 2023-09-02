//
//  MovieDetailsView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 02/09/2023.
//

import SwiftUI

struct MovieDetailsView: View {
    @State private var movie: Movie

    init(movie: Movie) {
        _movie = State(initialValue: movie)
    }

    var body: some View {
        VStack {
            PosterView(
                poster: movie.poster,
                title: movie.title,
                rating: movie.rating,
                onWatchList: movie.onWatchList
            )
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(
            title: "Super Long Long Long Movie Title",
            rating: 5.0,
            duration: "duration",
            genre: "genre",
            releasedDate: Date(),
            description: "Description",
            trailer: URL(string: "https://url.com")!,
            poster: "Tenet",
            onWatchList: true)
                         )
    }
}
