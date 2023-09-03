//
//  PosterView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 02/09/2023.
//

import SwiftUI

struct PosterSectionView: View {
    private let poster: String
    private let title: String
    private let rating: CGFloat
    private let trailer: URL
    @Binding var onWatchList: Bool
    @Environment(\.openURL) private var openURL

    init(poster: String, title: String, rating: CGFloat, trailer: URL, onWatchList: Binding<Bool>) {
        self.poster = poster
        self.title = title
        self.rating = rating
        self.trailer = trailer
        _onWatchList = onWatchList
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
                if $onWatchList.wrappedValue {
                    removeFromWatchListButton()
                } else {
                    addToWatchListButton()
                }

                watchTrailerButton(trailer)
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
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
    private func addToWatchListButton() -> some View {
        Button() {
            onWatchList = true
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
    private func removeFromWatchListButton() -> some View {
        Button() {
            onWatchList = false
        } label: {
            Text("REMOVE FROM WATCHLIST")
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
    private func watchTrailerButton(_ url: URL) -> some View {
        Button {
            openURL(url)
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
        PosterSectionView(
            poster: "Spider Man",
            title: "Spider",
            rating: 8.0,
            trailer: URL(string: "http://url.com")!,
            onWatchList: .constant(true))
    }
}
