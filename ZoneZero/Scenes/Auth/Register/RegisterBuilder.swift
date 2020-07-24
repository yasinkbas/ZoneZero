//
//  RegisterBuilder.swift
//  Mobillium-case
//
//  Created by yasinkbas on 22.07.2020.
//

import UIKit

class RegisterBuilder: ZoneZeroBuilder {
    func setup(with request: EmptyViewRequest) -> RegisterViewController {
        let view = RegisterView()
        let viewController = RegisterViewController(view: view)
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        viewController.setup()
        
        return viewController
    }
}

