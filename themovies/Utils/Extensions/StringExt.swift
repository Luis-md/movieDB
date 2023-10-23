//
//  StringExt.swift
//  themovies
//
//  Created by Luis Domingues on 21/05/23.
//

import Foundation

enum FeatureKind {
    case login
    case home
}

extension String {
    func localized(_ feature: FeatureKind = .home) -> String {
        var filename = String()
        
        switch feature {
        case .login:
            filename = "LoginStrings"
        case .home:
            filename = "HomeStrings"
        }
        
        return NSLocalizedString(self, tableName: filename, bundle: Bundle.main, value: String(), comment: String())
    }
}
