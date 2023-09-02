//
//  DetailsSectionView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 02/09/2023.
//

import SwiftUI

struct DetailsSectionView: View {

    private let genre: String
    private let releaseDate: String

    init(genre: String, releaseDate: String) {
        self.genre = genre
        self.releaseDate = releaseDate
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Details")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                .frame(height: 4)
            detailsItem(title: "Genre", description: genre)
            detailsItem(title: "Released date", description: releaseDate)
        }
    }

    @ViewBuilder
    private func detailsItem(title: String, description: String) -> some View {
        HStack {
            Text(title)
                .frame(width: 100, alignment: .trailing)
                .font(.caption.bold())
            Text(description)
                .font(.caption)
        }
    }
}

struct DetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSectionView(genre: "Action", releaseDate: "2020, 8 August")
    }
}
