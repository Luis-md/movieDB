//
//  ThemePillsCell.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//

import UIKit

final class ThemePillsCell: UICollectionViewCell {    
    lazy var themeLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.Inter(.semiBold, size: 16)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
        
    public func setupCell(content: ContentMovie) {
        themeLabel.text = content.gender
        backgroundColor = content.isSelected ? UIColor(red: 1.00, green: 0.12, blue: 0.54, alpha: 1.00) : .clear
        themeLabel.textColor = .white
        addSubview(themeLabel)
        NSLayoutConstraint.activate([
            themeLabel.topAnchor.constraint(equalTo: topAnchor),
            themeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            themeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            themeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
        ])
    }
}
