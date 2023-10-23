//
//  HomeStrings.swift
//  themovies
//
//  Created by Luis Domingues on 21/05/23.
//

import Foundation

enum HomeStrings: String {
    case moviesTheme = "moviesTheme"
    case seriesTheme = "seriesTheme"
    case titleText = "titleText"
    case searchTitle = "searchTitle"
    case latestMovies = "latestMovies"
    case mostPopular = "mostPopular"
    
    func localized() -> String { rawValue.localized() }
}
