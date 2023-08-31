//
//  MovieListView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    let data = Array(repeating: Movie(), count: 10)
    var body: some View {
        List(data) { _ in
            MovieCell()
                .alignmentGuide(.listRowSeparatorLeading) { d in
                    d[.leading] }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel())
    }
}

struct Movie: Identifiable {
    let id = UUID()
}
