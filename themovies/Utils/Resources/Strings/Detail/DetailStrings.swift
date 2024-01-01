//
//  DetailStrings.swift
//  themovies
//
//  Created by Luis Domingues on 01/01/24.
//

import Foundation

enum DetailStrings: String {
    case emptyMovieDescription = "emptyMovieDescription"
    
    func localized() -> String { rawValue.localized(.login) }
}
