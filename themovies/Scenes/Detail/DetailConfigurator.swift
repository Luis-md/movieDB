//
//  DetailConfigurator.swift
//  themovies
//
//  Created by Luis Domingues on 03/06/23.
//

import Foundation

class DetailConfigurator {
    static func configure(controller: DetailViewController, coordinator: Coordinator, contentID: Int, detailType: DetailType) {
        let presenter = DetailPresenter()
        let service = ServiceAPI()
        
        let interactor = DetailInteractor(presenter: presenter, coordinator: coordinator, contentID: contentID, service: service, detailType: detailType)
        
        controller.interactor = interactor
        presenter.viewController = controller

    }
}
