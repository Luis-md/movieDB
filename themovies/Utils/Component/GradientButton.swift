//
//  GradientButton.swift
//  themovies
//
//  Created by Luis Domingues on 30/04/23.
//

import UIKit

public struct ButtonDTO {
    let title: String
    let action: (() -> Void)?
    let colors: [UIColor]
}

class GradientButton: UIView {
    
    var buttonDTO: ButtonDTO?
    
    lazy var buttonText: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInit()
    }
        
    private func configureGradient() {
        guard let colors = buttonDTO?.colors, colors.count >= 2 else {
            layer.sublayers?.first(where: { $0 is CAGradientLayer })?.removeFromSuperlayer()
            backgroundColor = .clear
            return
        }

        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = buttonDTO?.colors.map { $0.cgColor }
        layer.insertSublayer(gradient, at: 0)
        backgroundColor = .clear
    }
    
    private func setupInit() {
        addSubview(buttonText)
        buttonText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonText.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            buttonText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            buttonText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
        
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let btnDTO = buttonDTO else { return }
        btnDTO.action?()
    }
    
    public func setupButton(btnDTO: ButtonDTO ) {
        self.buttonDTO = btnDTO
        
        if buttonDTO?.action != nil {
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                             action: #selector(handleTapGesture(_:))))
        }
        
        buttonText.text = buttonDTO?.title
        layer.cornerRadius = 10
        configureGradient()
    }
}
