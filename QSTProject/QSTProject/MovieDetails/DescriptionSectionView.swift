//
//  DescriptionSectionView.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 02/09/2023.
//

import SwiftUI

struct DescriptionSectionView: View {
    let description: String

    init(description: String) {
        self.description = description
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Short description")
                .bold()
            Text(description)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct DescriptionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionSectionView(description: "the description")
    }
}
