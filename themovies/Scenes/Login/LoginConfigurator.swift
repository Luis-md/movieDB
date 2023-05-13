//
//  LoginConfigurator.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//

import Foundation

class LoginConfigurator {
    static func configure(controller: LoginStarterViewController, coordinator: Coordinator) {
        let presenter = LoginStarterPresenter()
        let interactor = LoginStarterInteractor()
        
        controller.interactor = interactor
        presenter.viewController = controller
        interactor.coordinator = coordinator
        interactor.presenter = presenter
    }
}
