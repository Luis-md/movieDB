//
//  MainCoordinator.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func goesToHome()
    func goesToDetail(id: Int, title: String, detailType: DetailType)
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginStarterViewController()
        LoginConfigurator.configure(controller: vc, coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goesToHome() {
        let vc = HomeViewController()
        HomeConfigurator.configure(controller: vc, coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goesToDetail(id: Int, title: String, detailType: DetailType) {
        let vc = DetailViewController()
        vc.contentTitle = title
        DetailConfigurator.configure(controller: vc, coordinator: self, contentID: id, detailType: detailType)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
}
