//
//  PosterView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 02/09/2023.
//

import SwiftUI

struct PosterView: View {
    private let poster: String
    private let title: String
    private let rating: CGFloat
    private let onWatchList: Bool

    init(poster: String, title: String, rating: CGFloat, onWatchList: Bool) {
        self.poster = poster
        self.title = title
        self.rating = rating
        self.onWatchList = onWatchList
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(poster)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(4)
                .shadow(radius: 8, y: 4)

            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .top) {
                    Text(title)
                        .font(.headline.bold())
                    Spacer(minLength: 2)
                    ratingView()
                }
                addWatchListButton()
                watchTrailerButton()
            }
            .padding()
        }
    }

    @ViewBuilder
    private func ratingView() -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Text(String(format: "%.1f", rating))
                .font(.body.bold())
            Text("/10")
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }

    @ViewBuilder
    private func addWatchListButton() -> some View {
        Button() {
        } label: {
            Text("+ ADD TO WATCHLIST")
                .font(.caption)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.gray.opacity(0.3))
                }
                .foregroundColor(Color.secondary)

        }
    }

    @ViewBuilder
    private func watchTrailerButton() -> some View {
        Button {
        } label: {
            Text("WATCH TRAILER")
                .font(.caption)
                .foregroundColor(Color.primary)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primary, lineWidth: 1)
                        .foregroundColor(.clear)

                }
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(
            poster: "Spider Man",
            title: "Spider",
            rating: 8.0,
            onWatchList: true)
    }
}
