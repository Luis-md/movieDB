//
//  LoginStarterInteractor.swift
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

protocol LoginStarterBusinessLogic {
    func startLoginFields()
}

protocol LoginStarterDataStore
{
    //var name: String { get set }
}

class LoginStarterInteractor: LoginStarterBusinessLogic, LoginStarterDataStore
{
    var presenter: LoginStarterPresentationLogic?
    var worker: LoginStarterWorker?
    var coordinator: Coordinator?
    //var name: String = ""
    
    // MARK: Do something

    func startLoginFields() {
        coordinator?.goesToHome()
    }
    
}
