//
//  LoginStarterViewController.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginStarterDisplayLogic: AnyObject {
    func displayLoginFields()
}

class LoginStarterViewController: UIViewController, LoginStarterDisplayLogic {
    var interactor: LoginStarterBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImage(named: "background_welcome") ?? UIImage()
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageLogo: UIImageView = {
        let image = UIImage(named: "name_vector") ?? UIImage()
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: .zero, y: .zero, width: 176, height: 15)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var stackContent: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fill
        sv.alignment = .leading
        sv.axis = .vertical
        sv.spacing = 20
        return sv
    }()
    
    lazy var onboardingTitle: UILabel = {
        let lbl = UILabel()
        
        let lightFont = UIFont.Inter(.light, size: 32)
        let boldFont = UIFont.Inter(.bold, size: 32)
        
        let attributedText = NSMutableAttributedString(string: LoginStrings.onboardingFirstPart.localized(), attributes: [NSAttributedString.Key.font: lightFont])
        
        attributedText.append(NSAttributedString(string: LoginStrings.onboardingSecondPart.localized(), attributes: [NSAttributedString.Key.font: boldFont]))
        
        lbl.attributedText = attributedText
        lbl.textColor = .white
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var onboardingSubTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = LoginStrings.onboardingSubtitle.localized()
        lbl.font = UIFont.Inter(.regular, size: 16)
        lbl.textColor = .white
        lbl.numberOfLines = 0
        return lbl
    }()
    
    lazy var accessButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.Inter(.semiBold, size: 16) 
        button.titleLabel?.textColor = .white
        
        button.layer.cornerRadius = 20
        button.setTitle(LoginStrings.accessButton.localized(), for: .normal)
        button.backgroundColor = UIColor(red: 0.50, green: 0.00, blue: 1.00, alpha: 1.00)
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    @objc
    private func buttonTapped() {
        interactor?.startLoginFields()
    }
            
    func displayLoginFields() {
        onboardingTitle.isHidden = true
        onboardingSubTitle.isHidden = true
    }
    
}

extension LoginStarterViewController {
    private func setupConstraints() {
        view.addSubview(backgroundImage)
        view.addSubview(stackContent)
        view.addSubview(accessButton)
        stackContent.addArrangedSubview(imageLogo)
        stackContent.addArrangedSubview(onboardingTitle)
        stackContent.addArrangedSubview(onboardingSubTitle)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            stackContent.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16),
            stackContent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            stackContent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            accessButton.leadingAnchor.constraint(equalTo: stackContent.leadingAnchor),
            accessButton.trailingAnchor.constraint(equalTo: stackContent.trailingAnchor),
            accessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            accessButton.topAnchor.constraint(equalTo: stackContent.bottomAnchor, constant: 40),
            accessButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
