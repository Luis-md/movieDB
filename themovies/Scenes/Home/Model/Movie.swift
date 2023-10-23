//
//  Movie.swift
//  themovies
//
//  Created by Luis Domingues on 14/05/23.
//

import Foundation

struct ContentResult: Codable {
    let results: [DetailedContent]
}

struct DetailedContent: Codable {
    let posterPath: String?
    let id: Int
    let originalTitle: String?
    let originalName: String?
}
