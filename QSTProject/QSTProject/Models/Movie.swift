//
//  Movie.swift
//  QSTProject
//
//  Created by Khoi Nguyen on 31/08/2023.
//

import Foundation

struct Movie: Identifiable {
    let title: String
    let rating: CGFloat
    let duration: String
    let genre: String
    let releasedDate: Date
    let description: String
    let trailer: URL
    let poster: String
    
    var id: String {
        title
    }
}
