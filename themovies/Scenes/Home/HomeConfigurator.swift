//
//  HomeConfigurator.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//

import Foundation
class HomeConfigurator {
    static func configure(controller: HomeViewController, coordinator: Coordinator) {
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let service = ServiceAPI()
        
        controller.interactor = interactor
        presenter.viewController = controller
        interactor.coordinator = coordinator
        interactor.presenter = presenter
        interactor.service = service
    }
}
