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
    case detail
}

extension String {
    func localized(_ feature: FeatureKind = .home) -> String {
        var filename = String()
        
        switch feature {
        case .login:
            filename = "LoginStrings"
        case .home:
            filename = "HomeStrings"
        case .detail:
            filename = "DetailStrings"
        }
        
        return NSLocalizedString(self, tableName: filename, bundle: Bundle.main, value: String(), comment: String())
    }
    
    func formatDate(_ mydate:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertedDate = dateFormatter.date(from: mydate)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: convertedDate!)
        return date
    }

}
