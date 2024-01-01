//
//  MovieBannerCell.swift
//  themovies
//
//  Created by Luis Domingues on 02/05/23.
//

import UIKit
import SDWebImage

final class MovieBannerCell: UICollectionViewCell {
    lazy var movieImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        return img
    }()
    
    required init?(coder aDecoder: NSCoder) { nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    private func configureView() {
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    public func setupCell(content: String) {
        if content.isEmpty { return }
        let fullURL = URL(string: "https://image.tmdb.org/t/p/original\(content)")
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self else { return }
            if let urlPhoto = fullURL {
                DispatchQueue.main.async {
                    self.movieImage.sd_setImage(with: urlPhoto, placeholderImage: UIImage())
                }
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImage.image = nil
    }
}
