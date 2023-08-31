//
//  MovieCell.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import SwiftUI

struct MovieCell: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
            VStack(alignment: .leading) {
                Text("Title")
                Text("Description")
                Text("ON MY WATCH LIST")
            }
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell()
    }
}
