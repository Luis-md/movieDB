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
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    public func setupCell(content: String) {
        addSubview(movieImage)
        let fullURL = "https://image.tmdb.org/t/p/w500/\(content)"
        if let urlPhoto = URL(string: fullURL) {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: urlPhoto)
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.movieImage.image = image
                    }
                } catch _ {}
            }
        }
        
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
