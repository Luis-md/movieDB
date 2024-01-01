//
//  MovieDetailModel.swift
//  themovies
//
//  Created by Luis Domingues on 20/11/23.
//

import Foundation

struct MovieDetailModel: Codable {
    let backdropPath: String
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let runtime: Int
}
