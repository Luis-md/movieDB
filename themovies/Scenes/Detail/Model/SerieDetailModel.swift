//
//  SerieDetail.swift
//  themovies
//
//  Created by Luis Domingues on 01/01/24.
//

import Foundation

struct SerieDetailModel: Codable {
    let backdropPath: String
    let originalName: String
    let overview: String
    let firstAirDate: String
    let voteAverage: Double
    let lastEpisodeToAir: RuntimeEpisode
}

struct RuntimeEpisode: Codable {
    let runtime: Int
}
