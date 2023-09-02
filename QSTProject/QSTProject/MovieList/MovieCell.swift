//
//  MovieCell.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import SwiftUI

struct MovieCell: View {
    @State private var movie: Movie

    init(movie: Movie) {
        _movie = State(initialValue: movie)
    }

    var body: some View {
        HStack() {
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .cornerRadius(4)
                .shadow(radius: 8, y: 4)

            VStack(alignment: .leading, spacing: 2) {
                Text(movie.title)
                    .font(.headline.bold())
                Text("\(movie.duration) - \(movie.genre)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                if movie.onWatchList {
                    Text("ON MY WATCH LIST")
                        .font(.system(size: 9).bold())
                        .padding(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))
                }
            }
            .padding()
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MovieCell(movie: Movie(
                title: "Title",
                rating: 5.0,
                duration: "duration",
                genre: "genre",
                releasedDate: Date(),
                description: "Description",
                trailer: URL(string: "https://url.com")!,
                poster: "Tenet",
                onWatchList: true)
            )
            
            MovieCell(movie: Movie(
                title: "Title",
                rating: 5.0,
                duration: "duration",
                genre: "genre",
                releasedDate: Date(),
                description: "Description",
                trailer: URL(string: "https://url.com")!,
                poster: "Tenet",
                onWatchList: false)
            )
        }
    }
}
