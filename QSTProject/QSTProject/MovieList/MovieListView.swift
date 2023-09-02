//
//  MovieListView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @State private var showingSortOption = false

    var body: some View {
        List(viewModel.movies) { movie in
            MovieCell(movie: movie)
                .alignmentGuide(.listRowSeparatorLeading) { d in
                    -20 }
        }
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Sort") {
            showingSortOption.toggle()
        })
        .onAppear {
            viewModel.getMovieList()
        }
        .confirmationDialog("Sort by", isPresented: $showingSortOption) {
            Button("Title") {
                viewModel.sortByTitle()
            }
            Button("Released Date") {
                viewModel.sortByReleasedDate()
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel(service: JSONMovieListService()))
    }
}
