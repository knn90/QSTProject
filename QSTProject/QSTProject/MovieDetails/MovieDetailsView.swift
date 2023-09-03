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
        ScrollView {
            VStack(spacing: 20) {
                PosterSectionView(
                    poster: movie.poster,
                    title: movie.title,
                    rating: movie.rating,
                    onWatchList: movie.onWatchList
                )
                Divider()
                DescriptionSectionView(description: movie.description)

                Divider()
                DetailsSectionView(genre: movie.genre, releaseDate: movie.releasedDateString())

            }
            .padding()
        }
        .navigationBarTitle(movie.title, displayMode: .inline)

    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(
            title: "Super Long Long Long Movie Title",
            rating: 5.0,
            duration: "duration",
            genre: "Armed with only one word, Tenet, and fighting for the survival of long genre",
            releasedDate: Date(),
            description: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.",
            trailer: URL(string: "https://url.com")!,
            poster: "Tenet",
            onWatchList: true)
                         )
    }
}
