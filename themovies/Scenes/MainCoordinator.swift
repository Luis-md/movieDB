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
}
