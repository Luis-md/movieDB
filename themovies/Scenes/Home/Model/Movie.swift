//
//  Movie.swift
//  themovies
//
//  Created by Luis Domingues on 14/05/23.
//

import Foundation

struct Movie: Codable {
    let results: [DetailedMovie]
}

struct DetailedMovie: Codable {
    let backdrop_path: String
}
