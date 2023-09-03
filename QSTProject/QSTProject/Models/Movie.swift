//
//  Movie.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let title: String
    let rating: CGFloat
    let duration: String
    let genre: String
    let releasedDate: Date
    let description: String
    let trailer: URL
    let poster: String
    var onWatchList: Bool
    
    var id: String {
        title
    }

    func releasedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy, d MMMM"
        return dateFormatter.string(from: releasedDate)
    }
}
