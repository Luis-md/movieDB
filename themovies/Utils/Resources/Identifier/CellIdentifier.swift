//
//  CellIdentifier.swift
//  themovies
//
//  Created by Luis Domingues on 27/05/23.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
