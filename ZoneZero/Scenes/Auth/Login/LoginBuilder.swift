//
//  LoginBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class LoginBuilder: ZoneZeroBuilder {    
    
    func setup(with request: EmptyViewRequest) -> LoginViewController {
        let view            = LoginView()
        let viewController  = LoginViewController(view: view)
        let interactor      = LoginInteractor()
        let presenter       = LoginPresenter()
        let router          = LoginRouter()
        viewController.interactor   = interactor
        viewController.router       = router
        interactor.presenter        = presenter
        presenter.viewController    = viewController
        router.viewController       = viewController
        viewController.setup()
        
        return viewController
    }
}

