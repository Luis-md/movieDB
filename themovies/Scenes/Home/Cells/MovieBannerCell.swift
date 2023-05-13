//
//  MovieBannerCell.swift
//  themovies
//
//  Created by Luis Domingues on 02/05/23.
//

import UIKit

final class MovieBannerCell: UICollectionViewCell {
    lazy var movieImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        return img
    }()
    
    public func setupCell(content: String) {
        addSubview(movieImage)
        movieImage.image = UIImage(named: content)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
