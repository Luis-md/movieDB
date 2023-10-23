//
//  DetailConfigurator.swift
//  themovies
//
//  Created by Luis Domingues on 03/06/23.
//

import Foundation

class DetailConfigurator {
    static func configure(controller: DetailViewController, coordinator: Coordinator) {
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        controller.interactor = interactor
        presenter.viewController = controller
        interactor.coordinator = coordinator
        interactor.presenter = presenter
    }
}
